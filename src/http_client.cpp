#include "http_client.h"

std::string HttpClient::get_request_path() const {
    return host + ":" + port + target;
}
