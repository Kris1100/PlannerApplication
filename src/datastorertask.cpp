//Ready
#include <QDir>
#include <QDebug>
#include <QFile>
#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>
#include <QStandardPaths>

#include "datastorertask.h"
#include "task.h"

namespace DSPrivate {
QString formDataFilePathTask();
void createDataPathTask();

QJsonObject convertTaskToJsonObject(Task &task);
Task convertJsonObjectToTask(QJsonObject &jsonObject);
};

QString DSPrivate::formDataFilePathTask() {
    QDir dataDir(QStandardPaths::writableLocation(QStandardPaths::AppDataLocation));
    return dataDir.absoluteFilePath(QStringLiteral("datatask.json"));
}

void DSPrivate::createDataPathTask() {
    auto path = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);
    QDir directoryCreator;
    directoryCreator.mkpath(path);
}

Task DSPrivate::convertJsonObjectToTask(QJsonObject &jsonObject) {
    return Task(
                jsonObject["name"].toString(),
            jsonObject["text"].toString(),
            jsonObject["place"].toString(),
            jsonObject["time"].toString(),
            jsonObject["inportance"].toString(),
            jsonObject["participants"].toString(),
            jsonObject["money"].toString(),
            jsonObject["category"].toInt(),
            jsonObject["is_do"].toBool()
            );
}

QJsonObject DSPrivate::convertTaskToJsonObject(Task &task) {
    QJsonObject taskObject;
    taskObject["name"] = task.name;
    taskObject["text"] = task.text;
    taskObject["place"] = task.place;
    taskObject["time"] = task.time;
    taskObject["inportance"] = task.importance;
    taskObject["participants"] = task.participants;
    taskObject["money"] = task.money;
    taskObject["category"] = task.category;
    taskObject["is_do"] = task.is_do;
    return taskObject;
}

QList<Task> DataStorerTask::readDataTask() {
    QList<Task> tasks;
    qDebug() << "Data file path: " << DSPrivate::formDataFilePathTask();
    QFile dataFile(DSPrivate::formDataFilePathTask());
    if(!dataFile.exists()) {
        // Data does not exists
        return tasks;
    }
    if(!dataFile.open(QFile::ReadOnly)) {
        // File could not be openned
        return tasks;
    }
    auto rawData = dataFile.readAll();
    auto jsonDocument = QJsonDocument::fromJson(rawData);
    if(jsonDocument.isNull()) {
        // Data was not parsed
        return tasks;
    }
    if(!jsonDocument.isArray()) {
        // Root element is not array
        return tasks;
    }
    auto jsonArray = jsonDocument.array();
    foreach(QJsonValue arrayValue, jsonArray) {
        if(!arrayValue.isObject()) continue; // Element of the array is not an object
        auto jsonObject = arrayValue.toObject();
        tasks.append(DSPrivate::convertJsonObjectToTask(jsonObject));
    }
    return tasks;
}


QList<Task> DataStorerTask::readTemplates(QUrl file) {
    QList<Task> tasks;
    qDebug() << "Data file path: " << file.toLocalFile();
    QFile dataFile(file.toLocalFile());
    if(!dataFile.exists()) {
        // Data does not exists
        return tasks;
    }
    if(!dataFile.open(QFile::ReadOnly)) {
        // File could not be openned
        return tasks;
    }
    auto rawData = dataFile.readAll();
    auto jsonDocument = QJsonDocument::fromJson(rawData);
    if(jsonDocument.isNull()) {
        // Data was not parsed
        return tasks;
    }
    if(!jsonDocument.isArray()) {
        // Root element is not array
        return tasks;
    }
    auto jsonArray = jsonDocument.array();
    foreach(QJsonValue arrayValue, jsonArray) {
        if(!arrayValue.isObject()) continue; // Element of the array is not an object
        auto jsonObject = arrayValue.toObject();
        tasks.append(DSPrivate::convertJsonObjectToTask(jsonObject));
    }
    return tasks;
}




void DataStorerTask::storeDataTask(QList<Task> &tasks) {
    QJsonArray jsonArray;
    foreach(Task task, tasks) {
        jsonArray.append(DSPrivate::convertTaskToJsonObject(task));
    }
    QJsonDocument jsonDocument;
    jsonDocument.setArray(jsonArray);
    DSPrivate::createDataPathTask();
    QFile dataFile(DSPrivate::formDataFilePathTask());
    dataFile.open(QFile::WriteOnly);
    dataFile.write(jsonDocument.toJson(QJsonDocument::Indented));
    dataFile.close();
}

void DataStorerTask::deleteTask(int index){
   // QFile dataFile(DSPrivate::formDataFilePathTask());
    auto jsonArray=DataStorerTask::readDataTask();
    jsonArray.removeAt(index);
    DataStorerTask::storeDataTask(jsonArray);
}


