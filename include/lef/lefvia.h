#ifndef LEFVIA_H
#define LEFVIA_H

#include <string>
#include "leflayer.h"

using namespace std;

namespace lef {
	class LEFVia
	{
	public:
		LEFVia(string s);
		void addLayer(string n);
		void addRect(double x1, double y1, double x2, double y2);

		double x();
		double y();
		double height();
		double width();

		string getName();
		vector<LEFLayer*> getLayers();

	private:
		vector<LEFLayer*> m_layers;
		string m_name;

		double m_x1;
		double m_y1;
		double m_x2;
		double m_y2;

		LEFLayer *m_recentLayer;
	};
}

#endif // LEFVIA_H
