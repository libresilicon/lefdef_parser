#ifndef LEFDATA_H
#define LEFDATA_H

#include <istream>
#include <fstream>

#include <string>
#include <vector>

#include "lefmacro.h"
#include "lefvia.h"
#include "leflayerinfo.h"
#include "geometry.hpp"

namespace lef {

	struct LefUnits{
		  unsigned int timeConvertFactor;
		  unsigned int capacitanceConvertFactor;
		  unsigned int resistanceConvertFactor;
		  unsigned int powerConvertFactor;
		  unsigned int currentConvertFactor;
		  unsigned int voltageConvertFactor;
		  unsigned int databaseLEFconvertFactor = 100;
		  unsigned int frequencyConvertFactor;
	};

	class LEFScanner;
	class LEFParser;
	class LEFData
	{
	public:
		LEFData(string);
		void saveFile(string);
		LEFScanner *getLexer();

		bool isDefinedMacro(string name);
		lef::LEFMacro *getMacro(string);
		vector<LEFMacro*> getMacros();
		vector<LEFVia*> getVias();

		void setBaseUnitMicrons(int);
		int getBaseUnits();

		bool isDefinedVia(string name);
		void addViaName(std::string s);
		void addViaLayer(std::string s);
		void addViaLayerRectangle(double x1, double y1, double x2, double y2);

		void setMacroSize(double w, double h);
		void addMacroName(std::string s);
		void addMacroPinName(std::string s);
		void addMacroPinPortLayer(std::string s);
		void addMacroPinPortRectangle(double x1, double y1, double x2, double y2);
		void addMacroPinObstructionLayer(std::string s);
		void addMacroPinObstructionRectangle(double, double, double, double);
		void setMacroPinDirection(std::string s);
		void setMacroClass(std::string s);
		void setMacroSite(std::string s);
		void setSubBitChar(std::string s);
		void setDivideChar(std::string s);
		string getSubBitChar();
		string getDivideChar();

		void addLayer(std::string s);
		void setLayerType(std::string s);
		void setLayerArea(double);
		void setLayerPitch(double, double);
		vector<LEFLayerInfo*> getLayers();

		LefUnits units;
		vector<double> doubles;
		//private:
		LEFScanner *lexer;
		LEFParser* parser;
		bool trace_parsing;
		bool trace_scanning;
		string streamname;

		// work variables:
		vector<LEFMacro*> m_macros;
		vector<LEFVia*> m_vias;
		LEFMacro *m_recentMacro;
		LEFVia *m_recentVia;
		LEFLayerInfo *m_recentLayer;
		vector<LEFLayerInfo*> m_layers;

		string recentMacroName;
		string recentMacroPinName;
		string recentMacroPinPortLayer;
		string m_subBitChar;
		string m_divideChar;

		string recentMacroPinObstructionLayer;
	};
}

#endif // LEFDATA_H
