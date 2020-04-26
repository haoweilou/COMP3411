import numpy as np
import pandas as pd
from sklearn import preprocessing
from sklearn import tree
from sklearn.datasets import load_iris
from sklearn.preprocessing import LabelEncoder

data = pd.read_csv('./adult.data',header=None) #load data
features = data.iloc[:,:-1].values
answer = data.iloc[:,-1].values

test = pd.read_csv('./adult.test',header=None,skiprows=1) #load test
features_test = data.iloc[:,:-1].values
answer_test = test.iloc[:,-1].values

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

decision_tree = tree.DecisionTreeClassifier(criterion='entropy',splitter='best',max_depth=6,random_state=0)
decision_tree = decision_tree.fit(features,answer)

encode_data.fit(features_test[: , 1])
features_test[: , 1] = encode_data.fit_transform(features_test[: , 1])
features_test[: , 3] = encode_data.fit_transform(features_test[: , 3])
features_test[: , 5] = encode_data.fit_transform(features_test[: , 5])
features_test[: , 6] = encode_data.fit_transform(features_test[: , 6])
features_test[: , 7] = encode_data.fit_transform(features_test[: , 7])
features_test[: , 8] = encode_data.fit_transform(features_test[: , 8])
features_test[: , 9] = encode_data.fit_transform(features_test[: , 9])
features_test[: , 13] = encode_data.fit_transform(features_test[: , 13])

prediction = decision_tree.predict(features_test)
i = 0
correct = 0
while i < len(prediction):
    if prediction[i] == answer_test[i]:
        correct += 1
    i += 1
print('The accuracy rate is:',"{:.2%}".format(correct/i))

feature_name = ['age','workclass','fnlwgt','education','education-num','marital-status',
'occupation','relationship','race','sex','capital-gain',
'capital-loss','hours-per-week', 'native-country']
target_name = ['>50k','<=50k']
import graphviz
dot_data = tree.export_graphviz(decision_tree, out_file=None, feature_names=feature_name, class_names=None, filled=True, rounded=True, special_characters=True)
graph = graphviz.Source(dot_data)
graph.format='png' 
graph.render()
from IPython.display import Image
Image(filename="Source.gv.png", width = 1000, height=300)