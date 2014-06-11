// JavaScript (Underscore.js)によるプログラム
// author: OHASHI Kent

var FIRST_PRIME = 2;

// エラトステネスの篩(ふるい)により最大値maxまでの素数のリストを取得する。
// maxが数値でない場合、TypeErrorを発生させる。
var primeNumbers = function (max) {
    var numbers = [];
    var primes = [];
    var stopPoint = 0;

    if (typeof max !== "number" || !isFinite(max)) {
        throw {
            name: "TypeError",
            message: "max must be a number"
        };
    }

    numbers= _.range(FIRST_PRIME, max + 1);
    stopPoint = Math.floor(Math.sqrt(max));
    return primeFilter(numbers, primes, stopPoint);
};

var primeFilter = function primeFilter (numbers, primes, stopPoint) {
    var n = _.first(numbers);

    if (numbers === []) {
        return [];
    } else if (n > stopPoint) {
        return primes.concat(numbers);
    } else {
        primes.push(n);
        return primeFilter(_.filter(_.rest(numbers), function (x) {
            return x % n !== 0;
        }), primes, stopPoint);
    }
};

// 実行例
console.log(primeNumbers(100));