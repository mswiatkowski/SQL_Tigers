import pandas as pd

data_path = r"C:\Users\marti\Desktop\SQL_projekt\SQL_Tigers\Customer_proc.csv".replace('\\', '/')

data = pd.read_csv(data_path)

# print(data['AlbumId'].isna())
# print(data.dtypes)

to_drop = ['SupportRepId']

for col in to_drop:
    data = data.drop(col, axis=1)

data.to_csv('Customer_proc.csv', index=False, sep='|')



