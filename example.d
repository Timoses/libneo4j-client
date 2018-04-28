// Run with:
//  rdmd -L-lneo4j-client
// or
//  dub test

import neo4j.client;

enum dbUri = "neo4j://neo4j:test@localhost:7687";

int main()
{
    neo4j_client_init();

    import std.string : toStringz;
    neo4j_connection_t* connection =
        neo4j_connect(toStringz(dbUri), null, NEO4J_INSECURE);

    if (connection is null)
    {
        import core.stdc.stdio : stderr;
        import core.stdc.errno : errno;

        neo4j_perror(stderr, errno, "Connection failed");
        return 1;
    }

    neo4j_close(connection);
    neo4j_client_cleanup();

    return 0;
}
