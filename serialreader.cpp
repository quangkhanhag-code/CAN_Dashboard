#include "serialreader.h"

serialReader::serialReader(QObject *parent)
    : QObject{parent}, m_speed(0.0), m_rpm(0.0) //Constructor của class serialReader, kế thừa từ QObject
{
    m_serialPort = new QSerialPort(this);
    m_serialPort->setPortName("COM4"); // Thay đổi COM3 thành cổng mà bạn muốn sử dụng
    m_serialPort->setBaudRate(QSerialPort::Baud115200);
    m_serialPort->setDataBits(QSerialPort::Data8);
    m_serialPort->setParity(QSerialPort::NoParity);
    m_serialPort->setStopBits(QSerialPort::OneStop);
    if (m_serialPort->open(QIODevice::ReadOnly))
    {
        connect(m_serialPort, &QSerialPort::readyRead,
                this, &serialReader::readSerialData);
    }else {
        qDebug() << "LỖI: Không mở được cổng Serial!" << m_serialPort->errorString();
    }
}

QString serialReader::serialData() const
{
    return m_serialData;
}

void serialReader::readSerialData()
{
    m_buffer.append(m_serialPort->readAll());

    while (m_buffer.contains('\n'))
    {
        int index = m_buffer.indexOf('\n');
        QByteArray line = m_buffer.left(index).trimmed();
        m_buffer.remove(0, index + 1);

        m_serialData = QString::fromUtf8(line);

        m_rpm = m_serialData.toDouble(); // Giả sử dữ liệu serial là RPM gốc
        m_speed = m_rpm * 0.03; // Chuyển đổi RPM thành tốc độ (km/h)
        //emit serialDataChanged();
        emit speedChanged();
        emit rpmChanged();
    }
}

double serialReader::speed() const
{
    return m_speed;
}

double serialReader::rpm() const
{
    return m_rpm;
}
