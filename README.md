# Heart Disease Risk Prediction using XGBoost

Heart disease remains one of the most significant public health challenges globally, accounting for a substantial proportion of premature deaths and long-term disability. Early detection and timely intervention are crucial to mitigating the impact of this condition and improving the quality of life for patients.

This project presents a machine learning approach to predict heart disease using **XGBoost**, a scalable and high-performance ensemble algorithm well-known for its effectiveness in classification tasks.

---

##  Project Objective

To develop a machine learning-based predictive system that can estimate an individual’s probability of developing **Coronary Heart Disease (CHD)** within the next 10 years using health-related data from the **Framingham Heart Study**.

---

##  Key Features

- **Binary classification** of CHD risk (High Risk / Low Risk)
- **Probability score** for nuanced risk interpretation
- **Interactive dashboard** for clinicians to input data and get instant predictions
- Insights into the **most influential clinical features**

---

##  Technologies Used

- Python  
- XGBoost  
- Random Forest  
- Scikit-learn  
- Pandas, NumPy  
- Matplotlib, Seaborn  
- Streamlit (for dashboard)

---

##  Project Pipeline

### 1. **Data Preprocessing**
- Handling missing values  
- Outlier detection and treatment  
- Normalization of clinical features (e.g., blood pressure, cholesterol)

### 2. **Feature Selection**
- Identification of key predictors using **XGBoost’s feature importance**
- Focus on impactful variables like age, chest pain type, cholesterol levels, ECG results

### 3. **Model Training**
- Trained multiple models including:  
  - Random Forest  
  - XGBoost (Primary Model)

### 4. **Performance Evaluation**
- Evaluated using metrics such as:  
  - **Accuracy**  
  - **Precision**  
  - **Recall**  
  - **F1-Score**

### 5. **Interactive Dashboard**
- Built using **Streamlit**
- Clinicians can input patient data to predict CHD risk instantly

### 6. **Clinical Application**
- Supports early diagnosis  
- Enables personalized decision-making in healthcare

---

##  Exploratory Data Analysis (EDA)

![EDA](https://github.com/user-attachments/assets/9dffecb7-0214-4e6b-92ed-25a984c1999b)  
![EDA2](https://github.com/user-attachments/assets/386e1e2b-781e-4dc2-bcfa-2ff4e456e303)  
![EDA3](https://github.com/user-attachments/assets/a37e7df0-78ba-4d51-9b64-0a54960eb84a)  
![EDA4](https://github.com/user-attachments/assets/7767a399-fe4d-4370-97fa-20781be3bf3a)  
![EDA5](https://github.com/user-attachments/assets/23003e7a-1ca4-4523-b0b5-17ae71d2c100)

---

##  Model Evaluation

![Model Evaluation](https://github.com/user-attachments/assets/8571d9a3-a2d0-495a-bbbc-35b9c57b6cc8)

---

##  Feature Insights

![Feature Importance](https://github.com/user-attachments/assets/3a89fb4c-9d9c-497d-9e2e-02a2ddacf1f0)  
![Insights1](https://github.com/user-attachments/assets/72a1c0c7-0718-4484-a287-a89e69f4611c)  
![Insights2](https://github.com/user-attachments/assets/191e56be-a76f-45ab-b3af-6c22c97faf20)  
![Insights3](https://github.com/user-attachments/assets/3c2e27d4-7fb8-4b0f-b3c0-cef5ca4863bd)

---

## ✅ Conclusion

The XGBoost-based model demonstrated high accuracy and consistent predictions, making it a reliable decision-support tool for early detection of coronary heart disease. By providing actionable insights and early warnings, this project contributes meaningfully to preventive healthcare.
