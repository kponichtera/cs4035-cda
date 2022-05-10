from imblearn.over_sampling import SMOTE

df = pd.read_csv("data/train_data.csv")

smote = SMOTE(random_state=0)
df_processed = process_data(df)

X, y = smote.fit_resample(df_processed, df['label'])

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.33, random_state=0)

print(f"Resampled data set: {len(X)}")
print(f"Training data set: {len(X_train)}")
print(f"Testing data set: {len(X_test)}")
print(f"Benign transactions used for training: {len(y_train[y_train == 0])}")
print(f"Fraudulent transactions used for training: {len(y_train[y_train == 1])}")
print(f"Benign transactions used for testing: {len(y_test[y_test == 0])}")
print(f"Fraudulent transactions used for testing: {len(y_test[y_test == 1])}")