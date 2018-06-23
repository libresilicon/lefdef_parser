#ifndef LEFDED_BASE_GEOM
#define LEFDED_BASE_GEOM

class Point {
    double x;
    double y;
};

class Rect {
    point ll,ur;

};

class Polygon {
   std::vector<Point> v;
   bool isPolygon90(), isPolygon45();;
}

#endif
