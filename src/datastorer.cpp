//Ready
#include <QDir>
#include <QDebug>
#include <QFile>
#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>
#include <QStandardPaths>

#include "datastorer.h"
#include "category.h"

namespace DSPrivate {
    QString formDataFilePath();
    void createDataPath();

    QJsonObject convertCategoryToJsonObject(Category &category);
    Category convertJsonObjectToCategory(QJsonObject &jsonObject);
};

QString DSPrivate::formDataFilePath() {
    QDir dataDir(QStandardPaths::writableLocation(QStandardPaths::AppDataLocation));
    return dataDir.absoluteFilePath(QStringLiteral("data.json"));
}

void DSPrivate::createDataPath() {
    auto path = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);
    QDir directoryCreator;
    directoryCreator.mkpath(path);
}

Category DSPrivate::convertJsonObjectToCategory(QJsonObject &jsonObject) {
    return Category(
    jsonObject["name"].toString(),
    jsonObject["id"].toInt()
    );
}

QJsonObject DSPrivate::convertCategoryToJsonObject(Category &category) {
    QJsonObject categoryObject;
    categoryObject["name"] = category.name;
    categoryObject["id"] = category.id;
    return categoryObject;
}

QList<Category> DataStorer::readData() {
    QList<Category> categories;
    qDebug() << "Data file path: " << DSPrivate::formDataFilePath();
    QFile dataFile(DSPrivate::formDataFilePath());
    if(!dataFile.exists()) {
        // Data does not exists
        return categories;
    }
    if(!dataFile.open(QFile::ReadOnly)) {
        // File could not be openned
        return categories;
    }
    auto rawData = dataFile.readAll();
    auto jsonDocument = QJsonDocument::fromJson(rawData);
    if(jsonDocument.isNull()) {
        // Data was not parsed
        return categories;
    }
    if(!jsonDocument.isArray()) {
        // Root element is not array
        return categories;
    }
    auto jsonArray = jsonDocument.array();
    foreach(QJsonValue arrayValue, jsonArray) {
        if(!arrayValue.isObject()) continue; // Element of the array is not an object
        auto jsonObject = arrayValue.toObject();
        categories.append(DSPrivate::convertJsonObjectToCategory(jsonObject));
    }
    return categories;
}

void DataStorer::storeData(QList<Category> &categories) {
    QJsonArray jsonArray;
    foreach(Category category, categories) {
        jsonArray.append(DSPrivate::convertCategoryToJsonObject(category));
    }
    QJsonDocument jsonDocument;
    jsonDocument.setArray(jsonArray);
    DSPrivate::createDataPath();
    QFile dataFile(DSPrivate::formDataFilePath());
    dataFile.open(QFile::WriteOnly);
    dataFile.write(jsonDocument.toJson(QJsonDocument::Indented));
    dataFile.close();
}
