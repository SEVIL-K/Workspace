const Categories = Object.freeze({

    REINFORCE: { name: '강화재료', dic: ['T3', '돌파', '실링', '금화', '결정', '파편', '융화'] },

    CARD: { name: '카드패키지', dic: ['카드', '설맞이 복주머니'] },

    JUMPING: {

        name: '점핑/슬롯확장권',

        dic: ['베른 패스', '로헨델 패스', '욘 패스', '페이튼 패스', '파푸니카 패스', '슬롯 확장권'],

    },

    BLESSING: {

        name: '축복(베아,니나브)',

        dic: ['니나브의 축복', '베아트리스의 축복'],

    },

    CONSUABLE: { name: '배틀아이템', dic: ['배틀 아이템 상자', '레이드 지원', '전투 지원'] },

    LUCKY: { name: '럭키박스/옷감', dic: ['옷감', '럭키 박스'] },

    ARKPASS: { name: '아크패스', dic: ['아크 패스'] },

    AVATAR: {

        name: '아바타/펫/탈것',

        dic: ['아바타', '무기', '펫', '탈 것', '- 스페셜', '염색'],

    },

    CRYSTAL: {

        name: '크리스탈',

        dic: ['크리스탈', '아이템 레벨 달성', '아이템 레벨 성장', '클리어팩', '성장 패키지 - '],

    },

    EXCHANGE: { name: '화폐거래소', dic: [] },

    ETC: { name: '기타(드레스룸, 미분류 패키지 등)', dic: [] },

});


function getCategory(title) {

    let category = Categories.ETC.name;

    for (const value of Object.values(Categories)) {

        const isInclude = value.dic.some((word) => title.includes(word));

        if (isInclude) {

            category = value.name;

            break;

        }

    }

    return category;

}


function numberFormat(num) {

    const regexp = /\B(?=(\d{3})+(?!\d))/g;

    return num.toString().replace(regexp, ',');

}


let purchaseSum = 0;

let purchaseLastNum = 1;

let purchaseList = [];

$.ajax({

    url: '/Cash/GetPurchaseList',

    type: 'GET',

    data: { Page: 1, StartDate: '2021.04.24', EndDate: '2022.04.24' },

    dataType: 'html',

    async: false,

    success: function (data) {

        let pageNum = $(data).find('.pagination__last')[0].getAttribute('onClick');

        if (pageNum != null) {

            purchaseLastNum = pageNum.replace(/[^0-9]/g, '');

            console.log(`캐시 아이템 ${purchaseLastNum} 페이지 존재`);

        }

    },

    error: function (xhr, status, error) {

        ajaxErrorHandler(xhr, status, error);

        return;

    },

});


for (let i = 1; i <= purchaseLastNum; i++) {

    $.ajax({

        url: '/Cash/GetPurchaseList',

        type: 'GET',

        data: { Page: i, StartDate: '2021.04.24', EndDate: '2022.04.24' },

        dataType: 'html',

        async: false,

        success: function (data) {

            let $items = $(data).find('tr');

            for (let i = 0; i < $items.length; i++) {

                let $item = $($items[i]);

                let $cash = $($item.find('td.list__price')[0]);

                let $itemName = $($item.find('span.list__buy-name')[0]);

                if ($itemName.text() != '') {

                    purchaseList.push({

                        cash: $cash.text().replace(/[^0-9]/g, ''),

                        name: $itemName.text(),

                    });

                }

            }

        },

        error: function (xhr, status, error) {

            ajaxErrorHandler(xhr, status, error);

            return;

        },

    });

}


let table = {};

purchaseList.forEach(function (item) {

    let cash = parseInt(item.cash);

    if (cash == 0) return;


    purchaseSum += cash;

    if (item.name in table) {

        table[item.name] += cash;

    } else {

        table[item.name] = cash;

    }

});


let etcList = [];

let allList = [];

let categoryTable = {};

for (const [key, value] of Object.entries(table)) {

    const category = getCategory(key);

    // console.log(key,value);
    allList.push({name: key, sum: value})

    if (category == Categories.ETC.name) {

        etcList.push({ name: key, sum: value });

    }

    if (category in categoryTable) {

        categoryTable[category] += value;

    } else {

        categoryTable[category] = value;

    }

}


let marketSum = 0;

let marketLastNum = 1;

let marketList = [];

$.ajax({

    url: '/Cash/GetMarketList',

    type: 'GET',

    data: { Page: 1, StartDate: '2021.04.24', EndDate: '2022.04.24' },

    dataType: 'html',

    async: false,

    success: function (data) {

        let pageNum = $(data).find('.pagination__last')[0].getAttribute('onClick');

        if (pageNum != null) {

            marketLastNum = pageNum.replace(/[^0-9]/g, '');

            console.log(`화폐 거래소 ${marketLastNum} 페이지 존재`);

        }

    },

    error: function (xhr, status, error) {

        ajaxErrorHandler(xhr, status, error);

        return;

    },

});


for (let i = 1; i <= marketLastNum; i++) {

    $.ajax({

        url: '/Cash/GetMarketList',

        type: 'GET',

        data: { Page: i, StartDate: '2021.04.24', EndDate: '2022.04.24' },

        dataType: 'html',

        async: false,

        success: function (data) {

            let $items = $(data).find('tr');

            for (let i = 0; i < $items.length; i++) {

                let $item = $($items[i]);

                let $cash = $($item.find('td.list__exchange')[0]);

                marketList.push($cash.text().replace(/[^0-9]/g, ''));

            }

        },

        error: function (xhr, status, error) {

            ajaxErrorHandler(xhr, status, error);

            return;

        },

    });

}


marketList.forEach(function (value) {

    if (value != '') {

        marketSum += parseInt(value);

    }

});

categoryTable[Categories.EXCHANGE.name] = marketSum;


let itemsHTML = '';

for (const [key, value] of Object.entries(categoryTable)) {

    itemsHTML += `
<li>${key}: ${numberFormat(value)}원</li>`;

}


let etcItemsHTML = '';

etcList.forEach(function (item) {

    etcItemsHTML += `
<li>${item.name}: ${numberFormat(item.sum)}원</li>`;

});



// ---------------------------------------------------

let allItemsHTML = '';

allList.forEach(function (item) {
    allItemsHTML += `
<li>${item.name}: ${numberFormat(item.sum)}원</li>`

});

// ----------------------------------------------------


document.children[0].innerHTML = `<!DOCTYPE html>
<html lang="ko">
<head><title>충전한 캐시는 어디로 갔을까? </title></head>
<body><h1> 2021.04.24 ~ 2022.04.24 <br> 충전한 캐시는 어디로 갔을까? (총 ${numberFormat(

    purchaseSum + marketSum,

)}원)</h1>
<ul>${itemsHTML}</ul>
<br>
<h3>기타에 포함된 내역</h3>
<ul>${etcItemsHTML}</ul>
<br>

<h3>상세 내역(기타 내용과 중복되는 부분 있음.)</h3>
<ul>${allItemsHTML}</ul>
</body>
</html>`;