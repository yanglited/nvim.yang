#include <cstdint>
#include <iostream>
#include <map>
#include <memory>
#include <string_view>
// #include <memory>

enum class Direction : uint8_t
{
    Up = 0,
    Down,
    Left,
    Right,
};

constexpr std::string_view to_string(Direction direction)
{
    switch (direction)
    {
        case Direction::Up:
            return "Up";
        case Direction::Down:
            return "Down";
        case Direction::Left:
            return "Left";
        case Direction::Right:
            return "Right";
        default:
            return "Unknown";
    }
}

class Entity
{
   public:
    Entity(std::string const& name, Direction direction)
        : m_name(name), m_direction(direction)
    {
        std::cout << "I am " << m_name << ", from direction "
                  << to_string(m_direction) << std::endl;
    }

   private:
    std::string m_name;
    Direction m_direction;
};

// run me with: g++ -std=c++17 test.cpp -o testcpp && ./testcpp
int main()
{
    int a = 0;
    auto p1 = std::make_unique<Entity>("yli1", Direction::Up);
    auto p2 = std::make_unique<Entity>("yli2", Direction::Down);
    std::cout << "hi " << std::endl;
}
