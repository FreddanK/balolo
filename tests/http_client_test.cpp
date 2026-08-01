#include "http_client.h"

#include <gtest/gtest.h>

TEST(HttpClientTest, ConcatenatesHostPortAndTarget) {
    HttpClient const client{.host = "example.com", .port = "8080", .target = "/api/v1"};

    EXPECT_EQ(client.get_request_path(), "example.com:8080/api/v1");
}

TEST(HttpClientTest, HandlesRootTarget) {
    HttpClient const client{.host = "localhost", .port = "80", .target = "/"};

    EXPECT_EQ(client.get_request_path(), "localhost:80/");
}

TEST(HttpClientTest, HandlesEmptyFields) {
    HttpClient const client{};

    EXPECT_EQ(client.get_request_path(), ":");
}
