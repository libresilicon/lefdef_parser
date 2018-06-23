#ifndef LEFPORT_H
#define LEFPORT_H

#include <vector>
#include <string>

#include "leflayer.h"

using namespace std;

namespace lef {
	class LEFPort {
	public:
		LEFPort();
		vector<string> getLayerNames();
		vector<LEFLayer*> getLayers();
		LEFLayer *getLayer(string);
		bool layerExists(string n);

		void addLayer(string);
	private:
		vector<LEFLayer*> m_layers;

	};
}

#endif // LEFPORT_H
