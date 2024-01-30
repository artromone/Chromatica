#ifndef LOGGER_H
#define LOGGER_H

class Logger
{
private:
    Logger();
    static Logger* loggerConnection;
public:
    Logger(const Logger&);
    Logger(Logger&&);
    Logger& operator=(const Logger&);
    Logger& operator=(Logger&&);

    static Logger* getConnction();
};

#endif // LOGGER_H
