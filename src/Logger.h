#ifndef LOGGER_H
#define LOGGER_H

#include <QString>
#include <QFile>

class Logger : public QObject
{
    Q_OBJECT
private:
    Logger();
    ~Logger(); //???
    void cleanOldLog(); // TODO
    static Logger* loggerConnection;
    QString logFileName;
    QFile logFile;
public:
    Logger(const Logger&);
    Logger(Logger&&);
    Logger& operator=(const Logger&);
    Logger& operator=(Logger&&);

    Q_INVOKABLE static Logger* getConnction();
    Q_INVOKABLE void insertLog(QString data, QString type = " ");
};

#endif // LOGGER_H
