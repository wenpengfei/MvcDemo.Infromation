//(function ($) {
//    $.f.Area = {
//        Provinces:
//            [
//        //浙江省
//                {
//                ProvinceId: 0, Name: '浙江省', Cities:
//                    [
//                        {
//                            CityId: 0, Name: '杭州', Regions:
//                            [
//                                {
//                                    RegionId: 0, Name: '西湖', Circles:
//                                    [
//                                        { CircleId: 0, Name: '文一路' },
//                                        { CircleId: 0, Name: '文二路' },
//                                        { CircleId: 0, Name: '文三路' },
//                                        { CircleId: 0, Name: '西湖' },
//                                        { CircleId: 0, Name: '北山' },
//                                        { CircleId: 0, Name: '灵隐' },
//                                        { CircleId: 0, Name: '西溪' },
//                                        { CircleId: 0, Name: '翠苑' },
//                                        { CircleId: 0, Name: '文新' },
//                                        { CircleId: 0, Name: '古荡' },
//                                        { CircleId: 0, Name: '西湖周边' },
//                                    ]
//                                },
//                                {
//                                    RegionId: 1, Name: '拱墅'
//                                },
//                                {
//                                    RegionId: 2, Name: '江干'
//                                },
//                                {
//                                    RegionId: 3, Name: '下城'
//                                },
//                                {
//                                    RegionId: 4, Name: '上城'
//                                },
//                                {
//                                    RegionId: 5, Name: '滨江'
//                                },
//                                {
//                                    RegionId: 6, Name: '余杭'
//                                },
//                                {
//                                    RegionId: 7, Name: '萧山'
//                                },
//                                {
//                                    RegionId: -1, Name: '杭州周边'
//                                },
//                            ]
//                        },

//                    ]
//            },
//            ],
//        //end Provinces

//        getProvince: function (provinceid) {
//            for (var i = 0; i < $.f.Area.Provinces.length; i++) {
//                if ($.f.Area.Provinces[i].ProvinceId == provinceid) {
//                    return $.f.Area.Provinces[i];
//                }
//            }
//        },
//        getCities: function (provinceid) {
//            return $.f.Area.getProvince(provinceid).Cities;
//        },
//        getCity: function (provinceid, cityid) {
//            var cities = $.f.Area.getCities(provinceid);
//            for (var i = 0; i < cities.length; i++) {
//                if (cities[i].CityId == cityid) {
//                    return cities[i];
//                }
//            }
//        },
//        getRegions: function (provinceid, cityid) {
//            return $.f.Area.getCity(provinceid, cityid).Regions;
//        },
//        getRegion: function (provinceid, cityid, regionid) {
//            var regions = $.f.Area.getRegions(provinceid, cityid);
//            for (var i = 0; i < regions.length; i++) {
//                if (regions[i].RegionId == regionid) {
//                    return regions[i];
//                }
//            }
//        },
//        getCircles: function (provinceid, cityid, regionid) {
//            return $.f.Area.getRegion(provinceid, cityid, regionid).Circles;
//        },
//        getCircle: function (provinceid, cityid, regionid, circleid) {
//            var circles = $.f.Area.getCircles(provinceid, cityid, regionid);
//            for (var i = 0; i < circles.length; i++) {
//                if (circles[i].CircleId == circleid) {
//                    return circles[i];
//                }
//            }
//        }

//    }

//})(jQuery)