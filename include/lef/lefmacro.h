#ifndef LEFMACRO_H
#define LEFMACRO_H

#include "lefpin.h"
#include "lefobstruction.h"
#include "geometry.hpp"

using namespace std;

namespace lef {
	class LEFMacro {
	public:
		LEFMacro(string);
		void addPin(string);

		void setSize(double w, double h);
		double getWidth();
		double getHeight();

		vector<string> getPinNames();
		vector<LEFPin*> getPins();
		LEFPin *getPin(string name);
		string getName();
		string getClass();
		string getSite();
		void setClass(string s);
		void setSite(string s);
		LEFObstruction *getObstruction();
		bool pinExists(string n);

	private:
		string m_name;
		string m_class;
		string m_site;
		vector<LEFPin*> m_pins;
		LEFObstruction* m_obstructions;

		double m_sizeW;
		double m_sizeH;
	};
}

#endif // LEFMACRO_H
