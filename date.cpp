#include "date.h"
#include <iostream>
#include <ctime> 
#include <list>





Date::Date(int dd, int mm, int yy) {
	this->day = dd;
	this->month = mm;
	this->year = yy;
	initMonths();
	initDays();
}



int Date::getDay()  { return this->day; }
int Date::getMonth()  { return this->month; }
int Date::getYear()  { return this->year; }


void Date::setDay(int d) { this->day = d; }
void Date::setMonth(int m) { this->month = m; }
void Date::setYear(int y) { this->year = y; }

ostream& operator<<(ostream& os, const Date& dt)
{
	tm timeStruct = {};   //using ctime so you don't have to calculate the day of the week using formulas (can be confusing)
	timeStruct.tm_year = dt.year - 1900;
	timeStruct.tm_mon = dt.month - 1;
	timeStruct.tm_mday = dt.day;
	timeStruct.tm_hour = 12;    //  To avoid any doubts about summer time, etc.
	mktime(&timeStruct);

	os << timeStruct.tm_mon +1 << '/' << timeStruct.tm_mday << '/' << timeStruct.tm_year + 1900;
	return os;
}

void Date::drawCalendar() {

	tm ts = {};   //using ctime so you don't have to calculate the day of the week using formulas (can be confusing)
	ts.tm_year = getYear() - 1900;
	ts.tm_mon = getMonth() - 1;
	ts.tm_mday = 1;
	ts.tm_hour = 12;    //  To avoid any doubts about summer time, etc.
	mktime(&ts);
	string daySt = days[ts.tm_wday];  //  0...6 for Sunday...Saturday
	string monthSt = months[ts.tm_mon];
	int numDays;
	list<int> dd;


	if (month == 2)
	{
		if ((year % 400 == 0) || (year % 4 == 0 && year % 100 != 0))
			numDays = 29;
		else
			numDays = 28;
	}
	//for months which has 31 days
	else if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12)
		numDays = 31;
	else
		numDays = 30;


	for (int i = 0; i < numDays; i++)
		dd.push_back(i + 1);


	cout << "\n\n\t" << monthSt<<", "<< ts.tm_year + 1900 <<"\n\n  Su  Mo  Tu  We  Th  Fr  Sa" << endl;
	switch (ts.tm_wday) {
	case 0:
		cout << "   ";
		for (int i = 0; i < 7; i++) {
			cout << dd.front() << "   ";
			dd.pop_front();
		}
		break;
	case 1:
		cout << "       ";
		for (int i = 0; i < 6; i++) {
			cout << dd.front() << "   ";
			dd.pop_front();
		}
		break;
	case 2:
		cout << "           ";
		for (int i = 0; i < 5; i++) {
			cout << dd.front() << "   ";
			dd.pop_front();
		}
		break;
	case 3:
		cout << "               ";
		for (int i = 0; i < 4; i++) {
			cout << dd.front() << "   ";
			dd.pop_front();
		}
		break;
	case 4:
		cout << "                   ";
		for (int i = 0; i < 3; i++) {
			cout << dd.front() << "   ";
			dd.pop_front();
		}
		break;
	case 5:
		cout << "                       ";
		for (int i = 0; i < 2; i++) {
			cout << dd.front() << "   ";
			dd.pop_front();
		}
		break;
	case 6:
		cout << "                           ";
		for (int i = 0; i < 1; i++) {
			cout << dd.front() << "   ";
			dd.pop_front();
		}
		break;
	
	}

	cout << "\n";
	int remainingDays = dd.size();
	
	for (int j = 0; j < 3; j++) {
		for (int i = 0; i < 7; i++) {
			if (dd.front()/10==0)
				cout << "   " << dd.front();
			else
				cout << "  " << dd.front();
			dd.pop_front();

		}
		cout << "\n";
	}

	remainingDays = dd.size();
	if (remainingDays > 0) {
		for (int i = 0; i < remainingDays; i++) {
			if (dd.front() / 10 == 0)
				cout << "   " << dd.front();
			else
				cout << "  " << dd.front();
			dd.pop_front();
		}
	}


}

int Date::operator>( const Date & y)
{
	double cmp;
	string os;
	tm timeStruct = {};   
	timeStruct.tm_year = y.year - 1900;
	timeStruct.tm_mon = y.month - 1;
	timeStruct.tm_mday = y.day;
	timeStruct.tm_hour = 12;    //  To avoid any doubts about summer time, etc.
	

	tm timeStruct2 = {};   
	timeStruct2.tm_year = this->getYear() - 1900;
	timeStruct2.tm_mon = this->getMonth() - 1;
	timeStruct2.tm_mday = this->getDay();
	timeStruct2.tm_hour = 12;    //  To avoid any doubts about summer time, etc.
	
	cmp = difftime(mktime(&timeStruct2), mktime(&timeStruct));

	if (cmp > 0.00) {
		return 1;
	}
	else if (cmp == 0.00) {
		return 0;
	}
	else
		return 2;

}


void Date::displayDate(int dd) {

	tm timeStruct = {};   //using ctime so you don't have to calculate the day of the week using formulas (can be confusing)
	timeStruct.tm_year = getYear() - 1900;
	timeStruct.tm_mon = getMonth() - 1;
	timeStruct.tm_mday = getDay() + dd;
	timeStruct.tm_hour = 12;    //  To avoid any doubts about summer time, etc.
	mktime(&timeStruct);
	string daySt = days[timeStruct.tm_wday];  //  0...6 for Sunday...Saturday
	string monthSt = months[timeStruct.tm_mon];

	cout << daySt + ", " + monthSt + " " << timeStruct.tm_mday << ", " << timeStruct.tm_year + 1900 << "\n";

	
	
}


void Date::incDecDate(int n) {
	tm timeStruct = {};   //using ctime so you don't have to calculate the day of the week using formulas (can be confusing)
	timeStruct.tm_year = getYear() - 1900;
	timeStruct.tm_mon = getMonth() - 1;
	timeStruct.tm_mday = getDay() + n;
	timeStruct.tm_hour = 12;    //  To avoid any doubts about summer time, etc.
	mktime(&timeStruct);
	
	this->day = timeStruct.tm_mday;
	this->month = timeStruct.tm_mon + 1;
	this->year = timeStruct.tm_year + 1900;

}




void Date::initMonths() {
	
	months[0] = "January";
	months[1] = "February";
	months[2] = "March";
	months[3] = "April";
	months[4] = "May";
	months[5] = "June";
	months[6] = "July";
	months[7] = "August";
	months[8] = "September";
	months[9] = "October";
	months[10] = "November";
	months[11] = "December";
}



void Date::initDays() {
	days[0] = "Sunday";
	days[1] = "Monday";
	days[2] = "Tuesday";
	days[3] = "Wednesday";
	days[4] = "Thursday";
	days[5] = "Friday";
	days[6] = "Saturday";
	
	
}

