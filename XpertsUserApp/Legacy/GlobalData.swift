//
//  GlobalData.swift
//  Justdial
//
//  Created by Vinayak Deshpande on 2/1/16.
//  Copyright © 2016 Justdial Ltd. All rights reserved.
//

import Foundation
import WebKit
import UIKit
import SDWebImage
//import Firebase
//import FirebaseAnalytics

var fromKilledState = false

@objcMembers open class GlobalData : NSObject {


    public static var ifAPICallForCart = false
    public static var universalCartCount : Int = 0

    public static var cartAddedPid : String = ""

    public static var savedKeyword = "Search B2B Products"
    public static var deviceTokenVOIP = ""
    @objc  public static var jdtracker = ""
    @objc  public static var referrer = "gen"
    @objc  public static var referID = ""
    public static var firstRunNew = ""
    public static var didload:Bool = false
    @objc public static var city:String? = "Mumbai"
    public static var state = ""
    @objc public static var ssid = ""
    @objc public static var showFBSignIn:String? = "0"
    @objc public static var userLoggedIn: String = "0"
    public static var gridautoplay:String = "0"
    public static var expectedNoOfRowsHotkeys:Int = 6
    public static var rfqPlayedOnce = ""
    public static var userSelectedCity:String? = ""
    public static var userSelectedState = ""
    public static var userSelectedArea = ""
    public static var jdPayTopHeaderHeight : CGFloat = 44
    public static var catalogeHeaderAdjust : CGFloat = 5
    @objc public static var UserUDID:String? = ""
    public static var deviceToken:String? = ""
    @objc public static var pushData:NSData = NSData()
    public static var latitude:String = ""
    public static var longitude:String = ""
    public static var geoHash = ""
    public static var rpSequence = ["ratings","address","verified","attrdata","linefive"]
    public static var jdPayNetworkIssue = true
    public static var userIP:String = ""
    public static var systemFontConsidered:String = "0"
    @objc public static var savedRevIdPostVerification:String = ""
    @objc public static var savedRedirectionUrl:String = ""
    public static var locality:String = ""
    @objc public static var notificationCountJD:String = ""
    public static var inboxCountJD:String = ""
    @objc public static var locationUrl:String = ""
    public static var pipActive:String = "0"
    public static var NDHeader:CGFloat = 230
    public static var screenWidth:CGFloat = UIScreen.main.bounds.width
    public static var screenHeight:CGFloat = UIScreen.main.bounds.height
    public static var languageVerticalNewSearch:String = "en"
    public static var languageVerticalNewSearchFullName:String = "en"

    public static var defaultGISDCode:String = ""
    @objc public static var userSid:String = "G89M71NVIuIaLrYCm6d0N2nj423JxFQ0%2FT%2BUGvWSOL8%3D"
    @objc public static var deviceIDForImpressionAndLeads:String = ""
    public static var authID:String = ""
    public static var profile_url:String = ""
    public static var vjdpay:String = ""
    public static var ujdpay:String = ""
    public static var notificationURL = ""
    @objc public static var rand1 = ""
    @objc public static var rand2 = ""
    @objc public static var rand3 = ""
    public static var restartJdSocial = false
    public static var filterSelectedRP = "0"
   @objc public static var mobileNo:String? = "9535033880"
    @objc public static var moreControllerCutoffIndex : Int = -1
    @objc public static var moreControllerTabIndex : Int = -1
    @objc public static var moreTabActive : Bool = false
    @objc public static var moreTabCurrentOptionSelected : String = ""
    public static var homePageCellToggle:NSNumber?
    public static var wap:String? = ""
    public static var mobileType:String? = ""
    public static var encryptedString:String? = ""
    public static var ISDcode:String? = ""
    public static var userConCode:String? = ""
    public static var apiRead:String? = ""
    public static var apiWrite:String? = ""
    public static var apiFriends:String? = ""
    public static var domainName:String? = ""
    public static var earnVerified:String? = ""
    public static var justResumed:String? = ""
    public static var isOwner:String = "0"
    public static var orderPlaced:String = ""
    public static var fromVoice:String = ""
    @objc public static var matrixID:String = ""
    public static var homeView:String = "LIST"
    public static var autosuggestParams:String = ""
    public static var autoPlaySetting:String = "WM"
    public static var autoPlaySettingForPIP:String = "WM"
    public static var homePgScrollCheck:String = ""
    public static var imageSearchURL:String = ""
    //Data City for ShopOnline
    public static var dataCity:String? = "Mumbai"
    public static var dataCityUserSelected:String? = ""
    public static var forceHotKeyUpdate = "0"
    public static var voiceSearch_news:String? = ""
    @objc public static var versionAPI = "13.0"
    @objc public static var newsID = ""
    @objc public static var voiceURLString  = "ws://speech.justdial.com/client/ws/speech"
    public static var musicIsExpanded = "0"
    @objc public static var socialuid = ""
    public static var languageCode = ""
    public static var language = ""
    @objc public static var isBeta = ""
    @objc public static var seoRedirect = false
    @objc public static var shouldForceLoginViaOTP = false
    @objc public static var indexOfJDP_flow = 100
    @objc public static var voipCallClicked = false

    @objc public static var removeControllerHoldFlag = false
    @objc public static var resetJDPayNavBar = false
    @objc public static var pauseFooterCickTracker = false
    @objc public static var maintainMoreSelected = false

    @objc public static var detectedPincode = ""
    @objc public static var selectedPincode = ""
    @objc public static var selectedTag = ""

    // Paths
    public static var winPath:String? = ""
    public static var jdmaps:String? = ""
    public static var wapPath:String? = ""
    @objc public static var defaultURL:String? = ""
    @objc public static var securePGDomain = "https://securepg.justdial.com/"
    //https://beta3.justdial.com:875/new_pg_upi/
    //@objc public static var securePGDomain = "https://pgportuser:pGP0rTu53r@beta3.justdial.com:875/new_pg_upi/"
    @objc public static var locationStatus = "YOUR LOCATION"
    public static var latitudeSelected = ""
    public static var longitudeStatus = ""
    public static var addNotificationOnceHomePg = "0"
    public static var addNotificationOnceAutoSuggestPg = "0"
    public static var slideMenuCalledFromWebview = ""

    public static var volumeControlGlobal : Int = 0
    public static var phpPath:String? = ""
    public static var friendsPath:String? = ""
    public static var defaultPathSetup:String? = ""
    public static var searchzZivaPathSetup:String? = ""
    public static var verticalsPath:String? = ""
    public static var searchToBeHidden:String? = ""
    public static var writePath:String? = ""
    @objc public static var readPath:String? = ""
  @objc public static var emailId:String = ""
    public static var didEnter:Bool? = false
    public static var didChangeTabOrWebview:Bool? = true
    public static var homePgLoadedVal:String = "0"
    @objc public static var pendingRatings:String = "0"

    public static var hotkeyClicked = ""
    public static var moreOption,firstTimeRightVC:NSNumber?

    public static var deviceId:String? = ""
    public static var reportOptions:Array<Dictionary<String, AnyObject>>?
    public static var reportOptionsAds:Array<Dictionary<String, AnyObject>>?

    public static var fromHomeBackFlag:String? = "0"
    public static var backToSocial:String? = "0"

    public static var globalNearMePressed:String? = ""
    @objc public static var name:String? = "Sriram"
    public static var profilePic:String? = ""
    @objc public static var profilePicLargeSize:String? = ""
    public static var coverPic:String? = ""
    @objc public static var profilePicImage:UIImage = UIImage.init(named: "JDSocialNoImg1")!
    public static var profilePicImageLargeSize:UIImage = UIImage.init(named: "jds_bg_img26")!
    public static var coverPicImage:UIImage = UIImage.init(named: "jds_bg_img26")!
    public static var isTaggedOnce:String = "0"
    public static var planurl:String = ""
    public static var plan_nid:String = ""
    public static var jde:String = ""

    public static var coverPicCentrePosition:CGPoint?
    public static var refreshHome:String = ""
    public static var refreshSocial:String = ""


    public static var verifyRemoveTog:String? = ""
    public static var viewControllersToRemove:NSMutableArray?
    public static var nearMeToggle:NSNumber?
    public static var favRedirectToggle,orderFlowerRedirect,wishlistRedirectToggle:NSNumber?
    @objc public static var area = ""
    public static var detectedArea = ""
    public static var detectedCity = ""
   @objc public static var detectedCountry = ""


    public static var originalCity:String? = ""
    public static var changeCountryFlag:String? = ""


    public static var items:NSMutableDictionary?
    public static var mobile_MD5:String? = ""

    public static var currentVerificationCode:String? = ""
    public static var currentRestaurentVid:String? = ""

    public static var indiaRibbon:NSMutableArray?
    public static var otherRibbon:NSMutableArray?

    public static var currentiOSVersion:String? = ""
    public static var saveProceedFlag:String? = ""
    public static var itemsTableGrocery:String? = ""
    public static var pageViewControllerViewDidAppearCalledOnce = false
    public static var pageViewControllerViewWillAppearCalledOnce = false
    public static var pageViewControllerViewDidLoadCalledOnce = false


    public static var currentRecentRatings:String? = ""

    public static var vendorText:String? = ""
    public static var cartItemDeleted:String? = ""

    public static var rechargeMobileNo:String? = ""
    public static var vendorURL:String? = ""
    public static var removeNavBarRPtoggle:String? = ""


    public static var defaultFriendsUrl = ""
    public static var recentFriendsData,areaDictSelectedInVertical:NSMutableDictionary?

    public static var orderVerifyFlag:String? = ""
    public static var prevSearchToggle:String? = ""



    public static var currentCategoryDict:NSMutableDictionary?
    public static var globalOkFlag:String? = ""
    public static var categorySelected:String? = ""
    public static var verticalOrderIDglobal:String? = ""
    public static var jdPayTopBarHeight : CGFloat = 64

    public static var registeredUPIVPA : String = ""


    public static var recentRatingsDataArray:NSMutableArray?

    public static var vendorDocIdsArray:NSMutableArray? = NSMutableArray()
    public static var vendorDocIdsbizeditArray:NSMutableArray? = NSMutableArray()
    public static var vendorDocIdsbizeditURLSArray:NSMutableArray? = NSMutableArray()

    public static var vendorsChatNameArray:NSMutableArray? = NSMutableArray()
    public static var vendorsChatAvatarArray:NSMutableArray? = NSMutableArray()
    public static var vendorsChatRoomIdArray:NSMutableArray? = NSMutableArray()
    public static var vendorsChatRoomTotalArray:NSMutableArray? = NSMutableArray()
    public static var rateAppShownAlready_Date:Date = Date()
    public static var catchAreaFlag:String? = ""
    public static var verticalFlowCity:String? = ""
    @objc public static var country:String? = ""
    public static var jdFlowSpecPage:String? = ""
    public static var submitAfterVerify:String? = ""
    public static var addExtraView:String? = ""
    public static var rightMenuGoHome:String? = ""
    public static var concode:String? = ""
    public static var fromCache = "0"
    public static var homePageAutoplay:String = "0"


    public static var addressId_vertical:String? = ""
    public static var name_vertical:String? = ""
    public static var loginID_vertical:String? = ""
    public static var bldg_vertical:String? = ""
    public static var street_vertical:String? = ""
    public static var area_vertical:String? = ""
    public static var pincode_vertical:String? = ""
    public static var landmark_vertical:String? = ""
    public static var phone_vertical:String? = ""
    public static var areaId_vertical:String? = ""
    public static var date_vertical:String? = ""
    public static var time_vertical:String? = ""
    public static var restaurantFlag:String? = ""
    public static var email_vertical:String? = ""

    //For TestDrive Vertical Starts


    public static var testDriveMainDictionary:NSMutableDictionary?
    public static var VerticalMainDictionary:NSMutableDictionary?
    public static var VerticalMainArray:NSMutableArray?


    public static var testDrive_date:String? = ""
    public static var testDrive_time:String? = ""
    public static var testDrive_brand:String? = ""
    public static var testDrive_model:String? = ""
    public static var rndNo1:String? = ""
    public static var rndNo2:String? = ""
    public static var rndNo3:String? = ""


    public static var searchesCount:Int = 0
    public static var slideMenuFromChat:String? = ""

    public static var Vert_name:String? = ""
    public static var Vert_city:String? = ""
    public static var Vert_building:String? = ""
    public static var Vert_street:String? = ""
    public static var Vert_area:String? = ""
    public static var Vert_pincode:String? = ""
    public static var Vert_landmark:String? = ""
    public static var QQFooter:String? = ""

    public static var paymentGatewayDomain = ""
    public static var arrayOfImageUrlsGlobal,arrayofVidGlobal,arrayOfDescriptionGlobal,arrayOfUrlGlobal:NSMutableArray?


    public static var imageUrlBeginning:String? = ""

    public static var busCitiesDataArray:NSMutableArray? = NSMutableArray()

    public static var afterAge_Social:String? = ""

    public static var afterAge_Videos:String? = ""

    @objc public static var logInViaWebview = ""
    @objc public static var appVersion = "8.41"
    @objc public static var sessionID = ""

    public static var socialVerison = "&apiversion=1.0.0"
    public static var pdocid = ""
    public static var localCountryCh = ""
    public static var localLangCh = ""
    public static var localLangFull = ""
    @objc public static var webview: WKWebView?
    @objc public static var functionName = ""
    public static var LastCricketCloseTime:TimeInterval = 0
    public static var CrossTapCounter:Int = 0
    @objc public static var currentTabColor:String = ""
    @objc public static var socialBadgeValue:String = ""
    @objc public static var videosBadgeValue:String = ""
    @objc public static var newsBadgeValue:String = ""
    public static var numberOfHomePageHotkeys = 0
    public static var numberOfA2ZHotkeys = 0
}
typealias JSONDictionary = [String : Any]

func asString(jsonDictionary: JSONDictionary) -> String {
  do {
    let data = try JSONSerialization.data(withJSONObject: jsonDictionary, options: .prettyPrinted)
    return String(data: data, encoding: String.Encoding.utf8) ?? ""
  } catch {
    return ""
  }
}



 

