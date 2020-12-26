const AWS = require('aws-sdk');

const dynamodb = new AWS.DynamoDB.DocumentClient({region: 'us-east-1'});

exports.handler = async(event) => {
    console.log("hi", event);
    let {cityName, cityReview} = JSON.parse(event.body);
    
    let item = {
        ID: 2,
        City_Name: cityName,
        Review: cityReview
    }

    let data= await dynamodb.put({
        TableName: "Cities",
        Item: item
    }).promise();

    return {
        statusCode: 200,
        body: JSON.stringify({
            message: "Data inserted/updated successfully."
        })
    };
}