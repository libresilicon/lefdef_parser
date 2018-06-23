#ifndef LEFLAYER_H
#define LEFLAYER_H

#include <vector>
#include <string>

using namespace std;

namespace lef {
	typedef struct {
		double x;
		double y;
		double w;
		double h;
	} rect_t;

	class LEFLayer {
	public:
		LEFLayer(string);
		void addRectangle(double, double, double, double);
		vector<rect_t> getRects();

		string getName();
	  //private:
		string m_name;
		vector<Rect> m_rects;

		void generateExportLayers();
	};
}

#endif // LEFLAYER_H
