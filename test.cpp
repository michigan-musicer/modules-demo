export module TuckTuck;

import <iostream>;

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
