#ifndef SDEFDATA_H
#define SDEFDATA_H

#include <istream>
#include <fstream>

#include <string>
#include <vector>
#include <map>

#include "defmoduleinfo.h"
#include "defrouteinfo.h"
#include "defdatapin.h"

using namespace std;

namespace def {
	typedef vector<DEFModuleInfo> mods_t;
	typedef vector<DEFDataPin> pins_t;

	class DEFScanner;
	class DEFData
	{
	public:
		DEFData(string file);

		// extraction functions
		mods_t getModules();
		pins_t getPins();

		class DEFScanner *getLexer();

		// building the info
		void setDistanceUnitMicrons(int t);
		void setAmountComponents(int i);
		void addUsedModuleNames(std::string instance_name, std::string macro_name);
		void addUsedModulePlacement(double x, double y);
		void addUsedModuleOrientation(std::string orient);
		void addUsedModule();

		// pins
		void addUsedPin();
		void addPin(std::string s);
		void setPinLayer(std::string s);
		void setPinPosition(double x, double y);
		void setPinArea(double x1, double y1, double x2, double y2);

		// routes
		void startRoutedInfo(std::string s);
		void startNetConnection(std::string s);
		void addToNetConnection(std::string c, std::string p);

		void setRoutedInfoVia(std::string s);
		void addRoutedInfoPoint(int x, int y);
		void shiftRoutedInfoPointX(int d);
		void shiftRoutedInfoPointY(int d);

		void startNewMetalInfo(std::string s);
		void setNewMetalInfoVia(std::string s);
		void storeNewMetalInfo();
		void addNewMetalPoint(int x, int y);
		void shiftNewMetalPointX(int d);
		void shiftNewMetalPointY(int d);

		int getDistanceUnit();

		// nets and routes
		vector<string> getNetList();
		map<string,DEFRouteInfo> getMainRoutes();
		map<string,vector<DEFRouteInfo> > getSecondaryRoutes();

		// get bbox values
		int getLowerX();
		int getLowerY();
		int getUpperX();
		int getUpperY();

		void setDieArea(double x1, double y1, double x2, double y2);

	private:
		mods_t m_parsedModules;
		DEFModuleInfo m_recentModule;

		pins_t m_parsedPins;
		DEFDataPin m_recentPin;

		// nets
		string m_recentNetName;
		map<string,DEFRouteInfo> m_mainRoutes;
		map<string,vector<DEFRouteInfo>> m_secondaryRoutes;
		DEFRouteInfo m_recentRoutedInfo;
		vector<string> m_netList;

		class DEFScanner* lexer;
		class DEFParser* parser;
		bool trace_parsing;
		bool trace_scanning;
		string streamname;

		bool distanceMicrons;
		int distanceMicronsValue;
		int amountComponents;

		Point m_lastPoint;

		// bounding rectangle
		int m_BBLowerX;
		int m_BBLowerY;
		int m_BBUpperX;
		int m_BBUpperY;
	};
}

#endif // SDEFDATA_H
