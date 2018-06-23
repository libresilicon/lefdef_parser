#ifndef LEFPIN_H
#define LEFPIN_H

#include <string>

#include "geometry.hpp"
#include "lefport.h"

using namespace std;

namespace lef {
enum pin_direction {
	PIN_INPUT,
	PIN_OUTPUT,
	PIN_INOUT
};
class LEFPin {
public:
	LEFPin(string);
	void setBoundingBox(double x1, double y1, double x2, double y2);
	void setDirection(string s);
	RectF getBoundingBox();

	string getName();
	LEFPort *getPort();
	vector<LEFLayer*> getPortLayers();
	Point getCenter();
	pin_direction getDirection();
	double width();
	double height();

private:
	string name;
	LEFPort *port;
	pin_direction m_direction;

	// bounding box:
	double m_x1;
	double m_y1;
	double m_x2;
	double m_y2;
	bool m_bbox_set;
};
}


#endif // LEFPIN_H
