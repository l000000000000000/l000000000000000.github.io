#ifndef _DATE_H_
#define _DATE_H_
#include <map>
#include <string>
using namespace std;



class Date {

	int day;
	int month;
	int year;
	std::map<int,std::string> months;
	std::map<int,std::string> days;
	

public:
	Date() { initMonths();
	};
	Date(int dd,int mm,int yy);
	void initMonths();
	void initDays();
	void setDay(int d);
	void setMonth(int m);
	void setYear(int y);
	int getDay() ;
	int getMonth()  ;
	int getYear();	
	void displayDate(int dd=0);
	void incDecDate(int n);
	void drawCalendar();
	int operator >(const Date&x);
	friend ostream& operator<<(ostream& os, const Date& dt);
	
	
};





#endif 