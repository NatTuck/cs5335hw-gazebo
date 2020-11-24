%module robot
%{
#include "robot.hh"
%}

class Robot {
  public:
    void (*on_update)(Robot*);

    float pos_x;
    float pos_y;
    float range;
    float pos_t;
    cv::Mat frame;

    Robot();
    ~Robot();

    void set_vel(double lvel, double rvel);
    bool update();
};
