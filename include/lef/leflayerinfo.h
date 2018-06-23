#ifndef LEFLAYERINFO_H
#define LEFLAYERINFO_H

#include <string>
#include <vector>

using namespace std;

typedef struct SpacingTable {
		vector<double> parallelrunlength;
		pair<double,vector<double>> width_spacingtable;
} SpacingTable;

class LEFLayerInfo
{
public:
	LEFLayerInfo();
	void setName(string s);
	void setType(string s);
	void setPitch(double i, double j);

	string getName();
	string getType();
	pair<double,double> getPitch();

	double minArea;
	//private:
	string m_name;
	string m_type;
	double m_pitch_x, m_pitch_y;
	SpacingTable spacingTable;
};

#endif // LEFLAYERINFO_H
