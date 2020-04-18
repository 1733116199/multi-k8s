const keys = require('./keys');
const redis = require("redis");

const redisClient = redis.createClient({
    host: keys.redisHost,
    port: keys.redisPort,
    retry_strategy: () => 1000
});

const sub = redisClient.duplicate();

function fib(index) { //DP CAN SPEED THIS UP SO MUCH!!! BUT WE WANT IT TO BE SLOW.
    if (index < 2) return 1;
    // return fib(index - 1) + fib(index - 2);
    var prev = 1,
        prev_prev = 1,
        curr = 1;
    for (var i = 2; i <= index; i++) {
        curr = prev + prev_prev;
        prev_prev = prev;
        prev = curr;
    }
    return curr;
}

sub.on('message', (channel, message) => {
    redisClient.hset('values', message, fib(parseInt(message)));
});

sub.subscribe('insert');