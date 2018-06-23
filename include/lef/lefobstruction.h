#ifndef LEFOBSTRUCTION_H
#define LEFOBSTRUCTION_H

#include <vector>
#include <string>

#include "leflayer.h"

using namespace std;

namespace lef {
class LEFObstruction {
public:
	LEFObstruction();
	void addLayer(string);
	vector<LEFLayer*> getLayers();
	bool layerExists(string n);
	LEFLayer *getLayer(string);
	void scaleObstruction(double,double);

private:
	vector<LEFLayer*> layers;
};
}


#endif // LEFOBSTRUCTION_H
