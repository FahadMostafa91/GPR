%Fitting a GPR Model
%Instructions are in the task pane to the left. Complete and submit each task one at a time.
%This code loads the data.
load data
whos data dataTrain dataTest

%Task 1
%Fit model and evaluate at test values.
%Create a GPR model named mdl using the training data. Then, use the model to predict the response for the test data and name it yPred. 
%Calculate the loss, or mean squared error, of the predictions and name it mdlMSE.
mdl = fitrgp(dataTrain,"y");

yPred = predict(mdl,dataTest);

mdlMSE = loss(mdl,dataTest);

%Plot the results.
plot(data.x,data.y,".")
hold on
plot(dataTest.x,yPred,".")
hold off
legend("All Data","Predictions","Location","Best")

%Further Practice

[yPred,~,yInt] = predict(mdl,dataTest);
hold on
plot(dataTest.x,yInt,"k--")
hold off

%You can see that the prediction intervals are large due to the presence of outliers. Try fitting a new model which ignores the outliers.
idxOut = isoutlier(dataTrain.y);
mdl2 = fitrgp(dataTrain(~idxOut,:),"y");
%Find predictions and intervals based on the new model, and add them to your plot.

%Try calculating the mean squared error for each model. How do they compare?
MSE = loss(mdl,dataTest)
MSE2 = loss(mdl2,dataTest)



Pred = predict(mdl,dataTest);
%Plot the results.
evaluateFit(dataTest.y,Pred,"GPR")
