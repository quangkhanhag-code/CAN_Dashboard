#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFontDatabase>
#include "realtime.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    qmlRegisterType<RealTime>("RealTimeLib", 1, 0, "RealTime");
    QFontDatabase::addApplicationFont(":/resource/assets/font/digital-7.ttf");

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("CAN_Dashboard", "Main");

    return app.exec();
}
