export module TuckTuck;

import <iostream>;

// yes this example is dumb and does nothing,
// that is the point of examples
namespace TuckTuck 
{
    int internal_function() 
    {
        std::cout << 5 << std::endl;
        return 5;
    }

    export int external_function()
    {
        return internal_function();
    }
}
