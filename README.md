Heart disease remains one of the most significant public health challenges globally, accounting for a substantial proportion of premature deaths and long-term disability. Early detection and timely intervention are crucial to mitigating the impact of this condition and improving the quality of life for patients.
This project presents an approach to heart disease prediction using supervised machine learning, with a focus on the implementation of the Xtreme Gradient Boosting (XGBoost) algorithm — a scalable and high-performance ensemble technique known for its effectiveness in classification tasks.
The project encompasses a structured pipeline consisting of data preprocessing, categorical variable encoding, training-test split, feature matrix preparation, and model development using XGBoost. Post-training, the model is evaluated using a variety of performance metrics including accuracy, precision, recall, and F1-score. Moreover, the importance of individual clinical features is analysed through Boost’s built-in feature importance functionality, offering insights into the most influential predictors in the context of heart disease.
The model achieved high accuracy and provided consistent predictions, indicating its potential as a reliable decision-support system for preliminary heart disease diagnosis.
------------------------------------------------------------------------------------------------------------------------
The primary objective of this project is to develop a machine learning-based predictive system that can estimate an individual’s probability of developing coronary heart disease (CHD) within the next 10 years. Using health-related data sourced from the Framingham Heart Study, this system aims to analyses key medical and lifestyle factors to determine the risk level of CHD.
The project leverages the XGBoost classification algorithm, known for its high performance and efficiency, to build a model capable of making accurate predictions. By learning from patterns within historical patient data — including variables such as age, blood pressure, cholesterol levels, diabetes status, smoking habits, and more — the system identifies the likelihood of future cardiovascular events.
This predictive model not only provides a binary classification (high risk or low risk) but also returns a probability score, offering a nuanced view of a person’s risk level. Individuals with a predicted probability above a specified threshold (e.g., 0.5) are flagged as high risk, while others are classified as low risk.
The broader goal of this project is to contribute to preventive healthcare by empowering users with early warnings and actionable insights. By identifying risk factors early, users can be encouraged to adopt healthier lifestyles or seek medical guidance, thereby reducing the potential impact of coronary heart disease in the long term.
------------------------------------------------------------------------------------------------------------------------------------
1.Data Preprocessing: The project handles missing values, outliers, and normalizes clinical variables (e.g., blood pressure and cholesterol) to ensure clean and consistent input data for training ML models.

2.Feature Selection: It identifies key predictors of heart disease using techniques like XGBOOST classification to focus on the most impactful variables such as age, chest pain type, cholesterol levels, and ECG results.

3.Model Training: Multiple machine learning algorithms—including Random Forests, XGBoost.

4.Performance Evaluation: The models are evaluated using metrics such as accuracy, precision-recall scores.

5.Interactive Dashboard: The project develops a user-friendly interface where clinicians can input patient data to predict heart disease risk instantly based on the trained ML model.

6.Clinical Application: By providing accurate predictions of heart disease presence, the system supports early diagnosis and personalized decision-making in healthcare settings.
------------------------------------------------------------------------------------------------------------------------------------------------------------
![image](https://github.com/user-attachments/assets/3a89fb4c-9d9c-497d-9e2e-02a2ddacf1f0)

------------------------------------------------------------------------------
Models Evaluation
![image](https://github.com/user-attachments/assets/8571d9a3-a2d0-495a-bbbc-35b9c57b6cc8)
----------------------------------------------------------------------------

Some Insights !!

![image](https://github.com/user-attachments/assets/72a1c0c7-0718-4484-a287-a89e69f4611c)
------------

![image](https://github.com/user-attachments/assets/191e56be-a76f-45ab-b3af-6c22c97faf20)

------------------------------------------------
![image](https://github.com/user-attachments/assets/3c2e27d4-7fb8-4b0f-b3c0-cef5ca4863bd)

------------------------------------------------------------

EDA

![image](https://github.com/user-attachments/assets/9dffecb7-0214-4e6b-92ed-25a984c1999b)


![image](https://github.com/user-attachments/assets/386e1e2b-781e-4dc2-bcfa-2ff4e456e303)


![image](https://github.com/user-attachments/assets/a37e7df0-78ba-4d51-9b64-0a54960eb84a)


![image](https://github.com/user-attachments/assets/7767a399-fe4d-4370-97fa-20781be3bf3a)


![image](https://github.com/user-attachments/assets/23003e7a-1ca4-4523-b0b5-17ae71d2c100)



