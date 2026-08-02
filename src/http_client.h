#pragma once

#include <string>

struct HttpClient {

    std::string host;
    std::string port;
    std::string target;

    [[nodiscard]]
    std::string get_request_path() const;
};
