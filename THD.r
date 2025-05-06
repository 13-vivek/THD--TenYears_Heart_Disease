library(shiny)
library(xgboost)
library(caret)
library(pROC)
library(ggplot2)
library(shinythemes)

# Load Dataset
baseBRF <- read.csv("dataset-framingham-heart-study.csv")
baseBRF <- na.omit(baseBRF)
baseBRF$TenYearCHD <- as.factor(baseBRF$TenYearCHD)

# Data Splitting
set.seed(12345)
index <- createDataPartition(baseBRF$TenYearCHD, p=0.7, list=FALSE)
data.train <- baseBRF[index, ]
data.test  <- baseBRF[-index, ]

# Convert Target Variable to Numeric for XGBoost
train_labels <- as.numeric(data.train$TenYearCHD) - 1
test_labels  <- as.numeric(data.test$TenYearCHD) - 1

# Remove Target Variable from Features
train_matrix <- as.matrix(data.train[, -which(names(data.train) == "TenYearCHD")])
test_matrix  <- as.matrix(data.test[, -which(names(data.test) == "TenYearCHD")])

# Convert to XGBoost DMatrix Format
dtrain <- xgb.DMatrix(data = train_matrix, label = train_labels)
dtest  <- xgb.DMatrix(data = test_matrix, label = test_labels)

# Define Parameters for XGBoost
params <- list(
  objective = "binary:logistic",
  eval_metric = "auc",
  max_depth = 6,
  eta = 0.01,
  nrounds = 100,
  min_child_weight = 3
)

# Train XGBoost Model
xgb_model <- xgb.train(params, dtrain, nrounds = params$nrounds,
                       watchlist = list(train = dtrain, test = dtest),
                       verbose = 0)

# SHINY APP
ui <- fluidPage(
  theme = shinytheme("cosmo"),
  titlePanel("Ten Year Coronary Artery Disease Classification"),
  
  tabsetPanel(
    tabPanel("Prediction",
             sidebarLayout(
               sidebarPanel(
                 numericInput("male", "Gender (1 = Male, 0 = Female)", 1, min = 0, max = 1),
                 numericInput("age", "Age", 52, min = 20, max = 100),
                 numericInput("education", "Education Level (1-4)", 4, min = 1, max = 4),
                 numericInput("currentSmoker", "Smoker (1 = Yes, 0 = No)", 1, min = 0, max = 1),
                 numericInput("cigsPerDay", "Cigarettes per Day", 30, min = 0, max = 50),
                 numericInput("BPMeds", "Blood Pressure Meds (1 = Yes, 0 = No)", 0, min = 0, max = 1),
                 numericInput("prevalentStroke", "History of Stroke (1 = Yes, 0 = No)", 0, min = 0, max = 1),
                 numericInput("prevalentHyp", "Hypertension (1 = Yes, 0 = No)", 0, min = 0, max = 1),
                 numericInput("diabetes", "Diabetes (1 = Yes, 0 = No)", 0, min = 0, max = 1),
                 numericInput("totChol", "Total Cholesterol", 346, min = 100, max = 600),
                 numericInput("sysBP", "Systolic Blood Pressure", 133, min = 80, max = 200),
                 numericInput("diaBP", "Diastolic Blood Pressure", 96, min = 50, max = 150),
                 numericInput("BMI", "Body Mass Index (BMI)", 25.95, min = 10, max = 50),
                 numericInput("heartRate", "Heart Rate (bpm)", 65, min = 40, max = 150),
                 numericInput("glucose", "Blood Glucose Level", 126, min = 50, max = 300),
                 actionButton("predict", "Predict")
               ),
               mainPanel(
                 h3("Predicted Risk:"),
                 verbatimTextOutput("prediction"),
                 h3("Factors Affecting Your Risk:"),
                 plotOutput("risk_factors_plot"),
                 h3("Recommended Remedies:"),
                 verbatimTextOutput("remedies")
               )
             )
    ),
    tabPanel("Visualizations",
             plotOutput("cholesterol_hist"),
             plotOutput("smoking_chd"),
             plotOutput("age_chd"),
             plotOutput("bp_vs_age"),
             plotOutput("bmi_density")
    )
    
  )
)

server <- function(input, output) {
  observeEvent(input$predict, {
    new_input <- matrix(c(
      input$male, input$age, input$education, input$currentSmoker, input$cigsPerDay,
      input$BPMeds, input$prevalentStroke, input$prevalentHyp, input$diabetes,
      input$totChol, input$sysBP, input$diaBP, input$BMI, input$heartRate, input$glucose
    ), nrow = 1)
    
    dnew <- xgb.DMatrix(data = new_input)
    new_pred_prob <- predict(xgb_model, newdata = dnew)
    new_pred_label <- ifelse(new_pred_prob > 0.5, "High Risk", "Low Risk")
    
    output$prediction <- renderText({
      paste("Prediction:", new_pred_label, "| Probability:", round(new_pred_prob, 4))
    })
    
    # Calculate and display risk factor differences
    healthy_values <- data.frame(
      Factor = c("Cigarettes per Day", "Total Cholesterol", "Systolic BP", "Diastolic BP", "BMI", "Glucose"),
      Patient_Value = c(input$cigsPerDay, input$totChol, input$sysBP, input$diaBP, input$BMI, input$glucose),
      Healthy_Range = c(0, 200, 120, 80, 25, 100)
    )
    
    healthy_values$Difference <- healthy_values$Patient_Value - healthy_values$Healthy_Range
    
    output$risk_factors_plot <- renderPlot({
      ggplot(healthy_values, aes(x = reorder(Factor, Difference), y = Difference, fill = Difference)) +
        geom_bar(stat = "identity", width = 0.6, show.legend = FALSE) +
        scale_fill_gradient2(low = "green", mid = "yellow", high = "red", midpoint = 0) +
        geom_text(aes(label = round(Difference, 1)), hjust = -0.2, size = 5) +
        labs(title = "Factors Affecting CHD Risk", x = "Health Factor", y = "Difference from Healthy Value") +
        theme_minimal() +
        coord_flip()
    })
    
    # Generate remedies
    remedies <- c()
    if (input$cigsPerDay > 0) remedies <- c(remedies, "Reduce smoking or quit for better heart health.")
    if (input$totChol > 200) remedies <- c(remedies, "Adopt a diet low in saturated fats and exercise more.")
    if (input$sysBP > 120) remedies <- c(remedies, "Monitor your blood pressure and reduce salt intake.")
    if (input$BMI > 25) remedies <- c(remedies, "Maintain a balanced diet and engage in regular exercise.")
    if (input$glucose > 100) remedies <- c(remedies, "Control sugar intake and exercise to improve metabolism.")
    
    output$remedies <- renderText({
      if (length(remedies) == 0) {
        "You are healthy! Keep up the good work!"
      } else {
        paste(remedies, collapse = "\n")
      }
    })
  })
  
  # Static visualizations
  output$cholesterol_hist <- renderPlot({
    ggplot(baseBRF, aes(x = totChol)) + 
      geom_histogram(binwidth = 20, fill = "blue", alpha = 0.7) + 
      labs(title = "Cholesterol Levels")
  })
  
  output$smoking_chd <- renderPlot({
    ggplot(baseBRF, aes(x = as.factor(currentSmoker), fill = TenYearCHD)) + 
      geom_bar() + 
      labs(title = "Smoking and CHD Relationship", x = "Smoker (0 = No, 1 = Yes)")
  })
  
  output$age_chd <- renderPlot({
    ggplot(baseBRF, aes(x = TenYearCHD, y = age)) + 
      geom_boxplot() + 
      labs(title = "Age vs. CHD Probability")
  })
  
  output$bp_vs_age <- renderPlot({
    ggplot(baseBRF, aes(x = age, y = sysBP)) +
      geom_point(alpha = 0.5, color = "blue") +
      geom_smooth(method = "lm", color = "red", se = TRUE) +
      labs(title = "Blood Pressure vs. Age", x = "Age", y = "Systolic Blood Pressure (sysBP)") +
      theme_minimal()
  })
  
  output$bmi_density <- renderPlot({
    ggplot(baseBRF, aes(x = BMI, fill = TenYearCHD)) +
      geom_density(alpha = 0.5) +
      labs(title = "BMI Distribution by CHD Status", x = "Body Mass Index (BMI)", y = "Density") +
      scale_fill_manual(values = c("blue", "red"), labels = c("No CHD", "CHD"))
  })
}


shinyApp(ui = ui, server = server)