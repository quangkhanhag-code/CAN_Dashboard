#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "realtime.h"
#include "serialreader.h"
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<RealTime>("RealTimeLib", 1, 0, "RealTime");
    serialReader serial;
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("serial", &serial);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    engine.loadFromModule("CAN_Dashboard", "Main");
    return app.exec();
}
