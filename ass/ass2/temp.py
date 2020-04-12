import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn import preprocessing
from sklearn import tree
from sklearn.impute import SimpleImputer
from sklearn.tree.export import export_text
from sklearn.preprocessing import LabelEncoder, OneHotEncoder
import graphviz

data = pd.read_csv('./adult.data',header=None) #load data
features = data.iloc[:,:-1].values
answer = data.iloc[:,-1].values

clean_data = SimpleImputer(missing_values='?', strategy="most_frequent") #clean data
features[:,::] = clean_data.fit_transform(features[:,::])

encode_data = LabelEncoder()#encode data
encode_data.fit(features[: , 1])
features[: , 1] = encode_data.fit_transform(features[: , 1])
features[: , 3] = encode_data.fit_transform(features[: , 3])
features[: , 5] = encode_data.fit_transform(features[: , 5])
features[: , 6] = encode_data.fit_transform(features[: , 6])
features[: , 7] = encode_data.fit_transform(features[: , 7])
features[: , 8] = encode_data.fit_transform(features[: , 8])
features[: , 9] = encode_data.fit_transform(features[: , 9])
features[: , 13] = encode_data.fit_transform(features[: , 13])

decision_tree = tree.DecisionTreeClassifier(criterion='entropy',splitter='best',max_depth=8,min_samples_split=30,random_state=0)
decision_tree = decision_tree.fit(features,answer)

features_name = ['age','workclass','fnlwgt','education','education-num',
'marital-status','occupation','relationship','race','sex','capital-gain',
'capital-loss','hours-per-week', 'native-country']
answers_name = ['>50k','<=50k']

dot_data = tree.export_graphviz(decision_tree, out_file=None, feature_names=None, class_names=None, filled=True, rounded=True, special_characters=True)
graph = graphviz.Source(dot_data)
graph.format='png' 
graph.render()
from IPython.display import Image
Image(filename="Source.gv.png", width = 1000, height=300)