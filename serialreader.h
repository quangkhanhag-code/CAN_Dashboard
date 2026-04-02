#ifndef SERIALREADER_H
#define SERIALREADER_H

#include <QObject>
#include <QtSerialPort/QSerialPort>
#include <QtSerialPort/QSerialPortInfo>
#include <QDebug>

class serialReader : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString serialData READ serialData NOTIFY serialDataChanged)
    Q_PROPERTY(double rpm READ rpm NOTIFY rpmChanged)
    Q_PROPERTY(double speed READ speed NOTIFY speedChanged FINAL)

public:
    explicit serialReader(QObject *parent = nullptr);

    QString serialData() const;
    Q_INVOKABLE double speed() const;
    Q_INVOKABLE double rpm() const;

private slots:
    void readSerialData();
signals:
    void serialDataChanged();
    void speedChanged();

    void rpmChanged();

private:
    QString m_serialData;
    QSerialPort *m_serialPort;
    QByteArray m_buffer;
    double m_speed;
    double m_rpm;
};

#endif // SERIALREADER_H
