package com.tgame.shell.view.components
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.ui.componets.ColorBar;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.NewButton;
   import com.tgame.common.ui.componets.NewSkinButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.VIP.vipHelpSpr;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import gs.TweenMax;
   
   public class VIP extends Sprite
   {
      
      public static const UI_VIP_CHENGJIUBTN_CLICK:String = "UI_VIP_CHENGJIUBTN_CLICK";
      
      public static const UI_VIP_BUYBTN_CLICK:String = "UI_VIP_BUYBTN_CLICK";
      
      public static const UI_VIPGUIZE_CLOSE:String = "UI_VIPGUIZE_CLOSE";
      
      public static const UI_VIP_YUANBAOFANHUAN:String = "UI_VIP_YUANBAOFANHUAN";
      
      public static const UI_VIP_JINPIAOFANHUAN:String = "UI_VIP_JINPIAOFANHUAN";
      
      private var yuanBaoFanHuanBtn:NewSkinButton;
      
      private var jinPiaoFanHuanBtn:NewSkinButton;
      
      private var ft:FTextArea;
      
      private var btn1:NewButton;
      
      private var btn2:NewButton;
      
      private var btn3:NewButton;
      
      private var btn4:NewButton;
      
      private var btn5:NewButton;
      
      private var btn6:NewButton;
      
      private var btn7:NewButton;
      
      private var btn8:NewButton;
      
      private var btn9:NewButton;
      
      private var btn10:NewButton;
      
      private var btn0:NewButton;
      
      private var btn:NewButton;
      
      private var btnHelp:FSimpleButton;
      
      private var helpCanvas:vipHelpSpr;
      
      public var tupoBo:Boolean = false;
      
      private var btnCJ:NewButton;
      
      private var btnBuy:NewButton;
      
      private var closeBtn:FSimpleButton;
      
      private var vip1:Sprite;
      
      private var vip2:Sprite;
      
      private var vip3:Sprite;
      
      private var vip4:Sprite;
      
      private var vip5:Sprite;
      
      private var vip6:Sprite;
      
      private var vip7:Sprite;
      
      private var vip8:Sprite;
      
      private var vip9:Sprite;
      
      private var vip10:Sprite;
      
      private var vip0:Sprite;
      
      private var vip:Sprite;
      
      private var container:Sprite;
      
      private var scroll:FVScorllBar;
      
      private var scroll0:FVScorllBar;
      
      private var scroll1:FVScorllBar;
      
      private var scroll2:FVScorllBar;
      
      private var scroll3:FVScorllBar;
      
      private var scroll4:FVScorllBar;
      
      private var scroll5:FVScorllBar;
      
      private var scroll6:FVScorllBar;
      
      private var scroll7:FVScorllBar;
      
      private var scroll8:FVScorllBar;
      
      private var scroll9:FVScorllBar;
      
      private var scroll10:FVScorllBar;
      
      private var cb:ColorBar;
      
      private var bg_bar:Bitmap;
      
      private var cbarFT:FTextArea;
      
      private var sprcb:Sprite;
      
      private var LV:DisplayObject;
      
      private var spr_lv:Sprite;
      
      private var gongMc:MovieClip;
      
      private var loadUrl:String;
      
      private var gongMcSpr:Sprite;
      
      private var arr:Array = [];
      
      private var tz:Sprite;
      
      private var vip_lv:int;
      
      private var goodSpr:Sprite;
      
      private var ftVIP:FTextArea;
      
      private var curVipSpr:Sprite;
      
      public function VIP()
      {
         super();
         this.init();
      }
      
      private function init() : void
      {
         var bg:DisplayObject;
         var bi:Bitmap;
         var bit0:DisplayObject;
         var $mask:Sprite = null;
         addEventListener(UI_VIPGUIZE_CLOSE,this.closevipHelp);
         this.helpCanvas = new vipHelpSpr();
         this.helpCanvas.$parent = this;
         addChild(this.helpCanvas);
         this.helpCanvas.x = 247 + 242 - 71;
         this.helpCanvas.y = 5 + 45 + 10;
         $mask = new Sprite();
         $mask.mouseEnabled = false;
         addChild($mask);
         $mask.x = 519 + 242 - 71;
         $mask.y = 0 + 45 + 10;
         with($mask.graphics)
         {
            beginFill(16711680,0.5);
            drawRect(0,0,280,390);
            endFill();
         }
         this.helpCanvas.mask = $mask;
         bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/VIP/vip_bg.swf");
         bg.x = 0;
         bg.y = -20;
         addChild(bg);
         this.tz = new Sprite();
         this.tz.graphics.beginFill(16711680,0);
         this.tz.graphics.drawRect(0,0,560,60);
         this.tz.graphics.endFill();
         this.tz.width = 520;
         this.tz.height = 60;
         this.tz.x = 0 + 242 - 71;
         this.tz.y = 13 + 45;
         this.tz.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDowns);
         addEventListener(MouseEvent.MOUSE_UP,this.mouseReleaseds);
         addChild(this.tz);
         this.bg_bar = StaticValue.getBitmapByClassName("ui.vipexp.bar.bg");
         addChild(this.bg_bar);
         this.bg_bar.width = 361;
         this.bg_bar.x = 125 + 242 - 71 + 40;
         this.bg_bar.y = 90 + 45 + 5 + 5;
         this.cb = new ColorBar(7,361,7);
         this.cb.x = 125 + 242 - 71 + 40;
         this.cb.y = 90 + 45 + 5 + 5;
         this.cb.showNumber(false);
         addChild(this.cb);
         this.container = new Sprite();
         addChild(this.container);
         this.container.x = 16 + 242 - 71;
         this.container.y = 146 + 8 + 45 + 5;
         with(this.container.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,485,210);
            endFill();
         }
         this.vip = new Sprite();
         addChild(this.vip);
         this.vip.x = 16 + 242 - 71;
         this.vip.y = 154 + 45 + 5;
         with(this.vip.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,480,165);
            endFill();
         }
         this.curVipSpr = this.vip;
         this.vip.visible = false;
         bi = StaticValue.getBitmapByClassName("ui.vip");
         bi.width = 410;
         bi.height = 110;
         bi.x = 40;
         bi.y = 0;
         this.vip.addChild(bi);
         this.goodSpr = new Sprite();
         this.vip.addChild(this.goodSpr);
         this.goodSpr.x = 5;
         this.goodSpr.y = 140;
         with(this.goodSpr.graphics)
         {
            beginFill(0,0.5);
            drawRect(0,0,580,50);
            endFill();
         }
         this.ftVIP = new FTextArea();
         this.ftVIP.x = 150;
         this.ftVIP.y = 120;
         this.ftVIP.textColor = StaticValue.YELLOW;
         this.ftVIP.height = 25;
         this.ftVIP.width = 300;
         this.vip.addChild(this.ftVIP);
         this.vip.visible = false;
         this.vip1 = new Sprite();
         addChild(this.vip1);
         this.vip1.x = 16 + 242 - 71;
         this.vip1.y = 154 + 45 + 5;
         with(this.vip1.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,480,165);
            endFill();
         }
         this.vip1.visible = false;
         this.vip2 = new Sprite();
         addChild(this.vip2);
         this.vip2.x = 16 + 242 - 71;
         this.vip2.y = 154 + 45 + 5;
         with(this.vip2.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,495,165);
            endFill();
         }
         this.vip2.visible = false;
         this.vip3 = new Sprite();
         addChild(this.vip3);
         this.vip3.x = 16 + 242 - 71;
         this.vip3.y = 154 + 45 + 5;
         with(this.vip3.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,480,165);
            endFill();
         }
         this.vip3.visible = false;
         this.vip4 = new Sprite();
         addChild(this.vip4);
         this.vip4.x = 16 + 242 - 71;
         this.vip4.y = 154 + 45 + 5;
         with(this.vip4.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,480,165);
            endFill();
         }
         this.vip4.visible = false;
         this.vip5 = new Sprite();
         addChild(this.vip5);
         this.vip5.x = 16 + 242 - 71;
         this.vip5.y = 154 + 45 + 5;
         with(this.vip5.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,480,165);
            endFill();
         }
         this.vip5.visible = false;
         this.vip6 = new Sprite();
         addChild(this.vip6);
         this.vip6.x = 16 + 242 - 71;
         this.vip6.y = 154 + 45 + 5;
         with(this.vip6.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,480,165);
            endFill();
         }
         this.vip6.visible = false;
         this.vip7 = new Sprite();
         addChild(this.vip7);
         this.vip7.x = 16 + 242 - 71;
         this.vip7.y = 154 + 45 + 5;
         with(this.vip7.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,480,165);
            endFill();
         }
         this.vip7.visible = false;
         this.vip8 = new Sprite();
         addChild(this.vip8);
         this.vip8.x = 16 + 242 - 71;
         this.vip8.y = 154 + 45 + 5;
         with(this.vip8.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,480,165);
            endFill();
         }
         this.vip8.visible = false;
         this.vip9 = new Sprite();
         addChild(this.vip9);
         this.vip9.x = 16 + 242 - 71;
         this.vip9.y = 154 + 45 + 5;
         with(this.vip9.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,480,165);
            endFill();
         }
         this.vip9.visible = false;
         this.vip10 = new Sprite();
         addChild(this.vip10);
         this.vip10.x = 16 + 242 - 71;
         this.vip10.y = 154 + 45 + 5;
         with(this.vip10.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,480,165);
            endFill();
         }
         this.vip10.visible = false;
         this.vip0 = new Sprite();
         addChild(this.vip0);
         this.vip0.x = 17 + 2 + 242 - 71;
         this.vip0.y = 154 + 2 + 45 + 5;
         with(this.vip0.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,556,190);
            endFill();
         }
         this.vip0.visible = false;
         this.scroll = new FVScorllBar(this.vip,190);
         this.scroll.x = 495 + 242 - 71 + 93;
         this.scroll.y = 154;
         this.scroll0 = new FVScorllBar(this.vip0,190);
         addChild(this.scroll0);
         this.scroll0.x = 495 + 242 - 71 + 93;
         this.scroll0.y = 154 + 45 + 5;
         this.scroll1 = new FVScorllBar(this.vip1,190);
         this.scroll1.x = 495 + 242 - 71 + 93;
         this.scroll1.y = 154 + 45 + 5;
         this.scroll2 = new FVScorllBar(this.vip2,190);
         this.scroll2.x = 495 + 242 - 71 + 93;
         this.scroll2.y = 154 + 45 + 5;
         this.scroll3 = new FVScorllBar(this.vip3,190);
         addChild(this.scroll3);
         this.scroll3.x = 495 + 242 - 71 + 93;
         this.scroll3.y = 154 + 45 + 5;
         this.scroll4 = new FVScorllBar(this.vip4,190);
         addChild(this.scroll4);
         this.scroll4.x = 495 + 242 - 71 + 93;
         this.scroll4.y = 154 + 45 + 5;
         this.scroll5 = new FVScorllBar(this.vip5,190);
         addChild(this.scroll5);
         this.scroll5.x = 495 + 242 - 71 + 93;
         this.scroll5.y = 154 + 45 + 5;
         this.scroll6 = new FVScorllBar(this.vip6,190);
         addChild(this.scroll6);
         this.scroll6.x = 495 + 242 - 71 + 93;
         this.scroll6.y = 154 + 45 + 5;
         this.scroll7 = new FVScorllBar(this.vip7,190);
         addChild(this.scroll7);
         this.scroll7.x = 495 + 242 - 71 + 93;
         this.scroll7.y = 154 + 45 + 5;
         this.scroll8 = new FVScorllBar(this.vip8,190);
         addChild(this.scroll8);
         this.scroll8.x = 495 + 242 - 71 + 93;
         this.scroll8.y = 154 + 45 + 5;
         this.scroll9 = new FVScorllBar(this.vip9,190);
         addChild(this.scroll9);
         this.scroll9.x = 495 + 242 - 71 + 93;
         this.scroll9.y = 154 + 45 + 5;
         this.scroll10 = new FVScorllBar(this.vip10,190);
         addChild(this.scroll10);
         this.scroll10.x = 495 + 242 - 71 + 93;
         this.scroll10.y = 154 + 45 + 5;
         this.ft = new FTextArea();
         this.ft.textColor = StaticValue.WHITE;
         this.ft.htmlText = "VIP1 可享有的特权：" + "<br>" + "1.打坐获得真气2倍收益；" + "<br>" + "2.打坐获得经验2倍收益；" + "<br>" + "3.商城购买折扣优惠90%；" + "<br>" + "4.副本每日可进入次数增加1次；" + "<br>" + "5.世界地图免费传送；" + "<br>" + "6.鬼爪技能1级；" + "<br>" + "7.每天可免费领取VIP1级特权礼包1个；" + "<br>" + "8.招财符每日可使用3次；" + "<br>" + "9.“神靴飞行”操作将不再消耗小飞靴道具；<br>" + "礼包内含：紫色榛子×2（未绑定），龙吟养成石×1；";
         this.ft.x = 15;
         this.ft.wordWrap = true;
         this.ft.y = 3;
         this.ft.width = 415;
         this.ft.height = 170;
         this.vip1.addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.textColor = StaticValue.WHITE;
         this.ft.htmlText = "VIP2 可享有的特权：" + "<br>" + "1.打坐获得真气2倍收益；" + "<br>" + "2.打坐获得经验2倍收益；" + "<br>" + "3.商城购买折扣优惠90%；" + "<br>" + "4.副本每日可进入次数增加1次；" + "<br>" + "5.世界地图免费传送；" + "<br>" + "6.鬼爪技能2级；" + "<br>" + "7.好友上限人数增加5人；" + "<br>" + "8.每天可免费领取VIP2级特权礼包1个" + "<br>" + "9.招财符每日可使用4次；" + "<br>" + "10.“神靴飞行”操作将不再消耗小飞靴道具；<br>" + "礼包内含：紫色榛子×2（未绑定），赏善罚恶令×2，龙吟养成石×1；";
         this.ft.x = 15;
         this.ft.y = 3;
         this.ft.width = 415;
         this.ft.wordWrap = true;
         this.ft.height = 170 + 20;
         this.vip2.addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.textColor = StaticValue.WHITE;
         this.ft.htmlText = "VIP3 可享有的特权：" + "<br>" + "1.打坐获得真气3倍收益；" + "<br>" + "2.打坐获得经验3倍收益；" + "<br>" + "3.打怪获得经验2倍收益；" + "<br>" + "4.商城购买折扣优惠90%；" + "<br>" + "5.副本每日可进入次数增加1次；" + "<br>" + "6.世界地图免费传送；" + "<br>" + "7.鬼爪技能3级；" + "<br>" + "8.好友上限人数增加10人；" + "<br>" + "9.每天可免费领取VIP3级特权礼包1个" + "<br>" + "10.“神靴飞行”操作将不再消耗小飞靴道具；<br>" + "11.招财符每日可使用5次；" + "<br>" + "礼包内含：紫色榛子×2（未绑定），赏善罚恶令×3，龙吟养成石×1；";
         this.ft.x = 15;
         this.ft.y = 3;
         this.ft.wordWrap = true;
         this.ft.width = 415;
         this.ft.height = 190 + 20 + 20;
         this.vip3.addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.textColor = StaticValue.WHITE;
         this.ft.htmlText = "VIP4 可享有的特权：" + "<br>" + "1.打坐获得真气3倍收益；" + "<br>" + "2.打坐获得经验3倍收益；" + "<br>" + "3.打怪获得经验2倍收益；" + "<br>" + "4.商城购买折扣优惠90%；" + "<br>" + "5.副本每日可进入次数增加2次；" + "<br>" + "6.全系统突破几率增加1%；" + "<br>" + "7.增加人物血量上限500点；" + "<br>" + "8.闭关收益增加一倍;" + "<br>" + "9.月签到补签次数1次;" + "<br>" + "10.随身商店功能；" + "<br>" + "11.世界地图免费传送；" + "<br>" + "12.鬼爪技能4级；" + "<br>" + "13.每日道具解绑个数40个；" + "<br>" + "14.好友上限人数增加20人；" + "<br>" + "15.每天可免费领取VIP4级特权礼包1个" + "<br>" + "礼包内含：紫色榛子×2（未绑定），赏善罚恶令×4，刑天血珀×1，小喇叭×1，VIP材料包×1，龙吟养成石×1；" + "<br>" + "16.获得VIP4级后， 可免费领取一次VIP4级成就奖励礼包" + "<br>" + "礼包内含：神武修为丹×25，宗师真气丹×5，刑天（神器）×1， 银票×2；" + "<br>" + "17.“神靴飞行”操作将不再消耗小飞靴道具；<br>" + "18.招财符每日可使用6次。" + "<br>";
         this.ft.x = 15;
         this.ft.y = 3;
         this.ft.width = 445;
         this.ft.wordWrap = true;
         this.ft.height = 307 + 20 + 20 + 20;
         this.vip4.addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.textColor = StaticValue.WHITE;
         this.ft.htmlText = "VIP5 可享有的特权：" + "<br>" + "1.打坐获得真气3倍收益；" + "<br>" + "2.打坐获得经验3倍收益；" + "<br>" + "3.打怪获得经验3倍收益；" + "<br>" + "4.副本每日可进入次数增加2次；" + "<br>" + "5.商城购买折扣优惠90%；" + "<br>" + "6.全系统突破几率增加2%；" + "<br>" + "7.增加人物血量上限2000点；" + "<br>" + "8.闭关收益增加一倍;" + "<br>" + "9.月签到补签次数2次;" + "<br>" + "10.随身商店功能；" + "<br>" + "11.世界地图免费传送；" + "<br>" + "12.鬼爪技能5级；" + "<br>" + "13.每日道具解绑个数50个；" + "<br>" + "14.好友上限人数增加30人；" + "<br>" + "15.仇人上限人数增加10人；" + "<br>" + "16.每天可免费领取VIP5级特权礼包1个礼包内含：紫色榛子×2（未绑定），赏善罚恶令×5，刑天血珀×1，小喇叭×2，VIP材料包×2，紫品神锻锤×5，龙吟养成石×1；" + "<br>" + "17.获得VIP5级后， 可免费领取一次VIP5级成就奖励礼包" + "<br>" + "礼包内含：神武修为丹×100，宗师真气丹×20， 银票×8，武魂丹×1；" + "<br>" + "18.“神靴飞行”操作将不再消耗小飞靴道具；<br>" + "19.招财符每日可使用7次。" + "<br>";
         this.ft.x = 15;
         this.ft.y = 3;
         this.ft.width = 445;
         this.ft.height = 305 + 20 + 20 + 20 + 20;
         this.vip5.addChild(this.ft);
         this.ft.wordWrap = true;
         this.ft = new FTextArea();
         this.ft.textColor = StaticValue.WHITE;
         this.ft.htmlText = "VIP6 可享有的特权：" + "<br>" + "1.打坐获得真气4倍收益；" + "<br>" + "2.打坐获得经验4倍收益；" + "<br>" + "3.打怪获得经验3倍收益；" + "<br>" + "4.副本每日可进入次数增加3次；" + "<br>" + "5.商城购买折扣优惠90%；" + "<br>" + "6.全系统突破几率增加3%；" + "<br>" + "7.增加人物血量上限6000点；" + "<br>" + "8.闭关收益增加一倍;" + "<br>" + "9.月签到补签次数3次;" + "<br>" + "10.随身商店功能；" + "<br>" + "11.鬼爪技能6级；" + "<br>" + "12.每日道具解绑个数60个；" + "<br>" + "13.世界地图免费传送；" + "<br>" + "14.好友上限人数增加50人；" + "<br>" + "15.仇人上限人数增加20人；" + "<br>" + "16.可收徒弟上限增加1人；" + "<br>" + "17.每天可免费领取VIP6级特权礼包1个礼包内含：紫色榛子×2（未绑定），赏善罚恶令×10，刑天血珀×1，小喇叭×3，VIP材料包×3，紫品锻神锤×10，龙吟养成石×1；" + "<br>" + "18.获得VIP6级后， 可免费领取一次VIP6级成就奖励礼包礼包内含：神武修为丹×300，宗师真气丹×60， 银票×24，武魂丹×1，坐骑潜能丹×1；" + "<br>" + "19.“神靴飞行”操作将不再消耗小飞靴道具；<br>" + "20.招财符每日可使用8次。" + "<br>";
         this.ft.x = 15;
         this.ft.y = 3;
         this.ft.width = 445;
         this.ft.wordWrap = true;
         this.ft.height = 325 + 20 + 20 + 20 + 20;
         this.vip6.addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.textColor = StaticValue.WHITE;
         this.ft.htmlText = "VIP7 可享有的特权：" + "<br>" + "1.打坐获得真气4倍收益；" + "<br>" + "2.打坐获得经验4倍收益；" + "<br>" + "3.打怪获得经验4倍收益；" + "<br>" + "4.副本每日可进入次数增加4次；" + "<br>" + "5.商城购买折扣优惠90%；" + "<br>" + "6.全系统突破几率增加4%；" + "<br>" + "7.增加人物血量上限12000点；" + "<br>" + "8.闭关收益增加一倍;" + "<br>" + "9.月签到补签次数4次;" + "<br>" + "10.随身商店功能；" + "<br>" + "11.鬼爪技能7级；" + "<br>" + "12.每日道具解绑个数70个；" + "<br>" + "13.世界地图免费传送；" + "<br>" + "14.好友上限人数增加70人；" + "<br>" + "15.仇人上限人数增加30人；" + "<br>" + "16.可收徒弟上限增加3人；" + "<br>" + "17.每天可免费领取VIP7级特权礼包1个礼包内含：紫色榛子×2（未绑定），赏善罚恶令×15，刑天血珀×1，小喇叭×5，VIP材料包×4，紫品神锻锤×15，龙吟养成石×1；" + "<br>" + "18.获得VIP7级后， 可免费领取一次VIP7级成就奖励礼包礼包内含：神武修为丹×600，宗师真气丹×120， 银票×48，武魂丹×1，坐骑潜能丹×1，坐骑梦幻丹×1；" + "<br>" + "19.“神靴飞行”操作将不再消耗小飞靴道具；<br>" + "20.招财符每日可使用9次。" + "<br>";
         this.ft.x = 15;
         this.ft.wordWrap = true;
         this.ft.y = 3;
         this.ft.width = 460;
         this.ft.height = 320 + 20 + 20 + 20 + 20;
         this.vip7.addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.textColor = StaticValue.WHITE;
         this.ft.htmlText = "VIP8 可享有的特权：" + "<br>" + "1.打坐获得真气5倍收益；" + "<br>" + "2.打坐获得经验5倍收益；" + "<br>" + "3.打怪获得经验5倍收益；" + "<br>" + "4.副本每日可进入次数增加5次；" + "<br>" + "5.商城购买折扣优惠90%；" + "<br>" + "6.全系统突破几率增加5%；" + "<br>" + "7.增加人物血量上限20000点；" + "<br>" + "8.闭关收益增加一倍;" + "<br>" + "9.月签到补签次数5次;" + "<br>" + "10.随身商店功能；" + "<br>" + "11.鬼爪技能8级；" + "<br>" + "12.每日道具解绑个数80个；" + "<br>" + "13.世界地图免费传送；" + "<br>" + "14.好友上限人数增加100人；" + "<br>" + "15.仇人上限人数增加50人；" + "<br>" + "16.可收徒弟上限增加5人；" + "<br>" + "17.每天可免费领取VIP8级特权礼包1个礼包内含：紫色榛子×2（未绑定），赏善罚恶令×30，刑天血珀×1，小喇叭×10，VIP材料包×5，紫品神锻锤×30，龙吟养成石×1；" + "<br>" + "18.获得VIP8级后， 可免费领取一次VIP8级成就奖励礼包礼包内含：神武修为丹×1000，宗师真气丹×200， 银票×80，武魂丹×1，坐骑潜能丹×1，坐骑梦幻丹×1，超级经验丹×1，刑天开光石×1；" + "<br>" + "19.“神靴飞行”操作将不再消耗小飞靴道具；<br>" + "20.招财符每日可使用10次。" + "<br>";
         this.ft.x = 15;
         this.ft.y = 3;
         this.ft.wordWrap = true;
         this.ft.width = 460;
         this.ft.height = 338 + 20 + 20 + 20 + 20;
         this.vip8.addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.textColor = StaticValue.WHITE;
         this.ft.htmlText = "VIP9 可享有的特权：" + "<br>" + "1、打坐获得真气6倍收益" + "<br>" + "2、打坐获得经验6倍收益" + "<br>" + "3、打怪获得经验5倍收益" + "<br>" + "4、副本每日可进入次数增加6次；" + "<br>" + "5、商城购买折扣优惠90%" + "<br>" + "6、全系统突破几率增加6%" + "<br>" + "7、增加人物防御5000点，血量上限30000点，" + "<br>" + "8、闭关收益增加一倍" + "<br>" + "9、月签到补签次数6次" + "<br>" + "10、随身商店功能" + "<br>" + "11、鬼爪技能9级" + "<br>" + "12、每日道具解绑个数90个" + "<br>" + "13、世界地图免费传送" + "<br>" + "14、好友上限人数增加150个" + "<br>" + "15、仇人上限人数增加70个" + "<br>" + "16、可收徒弟上限增加7个" + "<br>" + "17、每天可免费领取VIP9特权礼包1个礼包内含：紫色榛子×4（未绑定），赏善罚恶令×40，刑天血珀×2，小喇叭×15，VIP材料包×6，紫品神锻锤×40，龙吟养成石×1" + "<br>" + "18、获得VIP9级后，可免费领取一次VIP9级成就奖励礼包。内含：神武修为丹×1500，宗师真气丹×500， 银票×120，武魂丹×2，坐骑潜能丹×2，坐骑梦幻丹×1，超级经验丹×1，至尊兽王之魂";
         this.ft.x = 15;
         this.ft.y = 3;
         this.ft.wordWrap = true;
         this.ft.width = 460;
         this.ft.height = 338 + 20 + 20 + 20 + 20;
         this.vip9.addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.textColor = StaticValue.WHITE;
         this.ft.htmlText = "VIP10 可享有的特权：" + "<br>" + "1、打坐获得真气7倍收益" + "<br>" + "2、打坐获得经验7倍收益" + "<br>" + "3、打怪获得经验6倍收益" + "<br>" + "4、副本每日可进入次数增加7次；" + "<br>" + "5、商城购买折扣优惠90%" + "<br>" + "6、全系统突破几率增加7%" + "<br>" + "7、增加人物攻击5000，防御5000点，血量上限30000点，" + "<br>" + "8、闭关收益增加一倍" + "<br>" + "9、月签到补签次数7次" + "<br>" + "10、随身商店功能" + "<br>" + "11、鬼爪技能10级" + "<br>" + "12、每日道具解绑个数100个" + "<br>" + "13、世界地图免费传送" + "<br>" + "14、好友上限人数增加200个" + "<br>" + "15、仇人上限人数增加100个" + "<br>" + "16、可收徒弟上限增加10个" + "<br>" + "17、每天可免费领取VIP10特权礼包1个礼包内含：紫色榛子×6（未绑定），赏善罚恶令×50，刑天血珀×3，小喇叭×20，VIP材料包×7，紫品神锻锤×50，龙吟养成石×1、轩辕剑魄×1" + "<br>" + "18、获得VIP10级后，可免费领取一次VIP10级成就奖励礼包 内含：神武修为丹×2500宗师真气丹×1000，银票×200，武魂丹×3坐骑潜能丹×3，魔兽经验丹×2，超级经验丹×2，轩辕神剑（神器）";
         this.ft.x = 15;
         this.ft.y = 3;
         this.ft.wordWrap = true;
         this.ft.width = 460;
         this.ft.height = 338 + 20 + 20 + 20 + 20;
         this.vip10.addChild(this.ft);
         this.sprcb = new Sprite();
         addChild(this.sprcb);
         this.sprcb.x = 125 + 242 - 71 + 40;
         this.sprcb.y = 87 + 45 + 5 + 5;
         with(this.sprcb.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,361,13);
            endFill();
         }
         bit0 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/VIP/vip0.swf");
         this.vip0.addChild(bit0);
         this.btnHelp = new FSimpleButton();
         this.btnHelp.skin = "helpBtn";
         addChild(this.btnHelp);
         this.btnHelp.x = 20 + 460 + 242 - 71;
         this.btnHelp.y = 309 + 45 + 5 + 45 + 5;
         this.btnHelp.addEventListener(MouseEvent.CLICK,this.onClick);
         this.btnCJ = new NewButton();
         this.btnCJ.setPandding(8,2,18,10);
         this.btnCJ.setSkin("chunlianBtn");
         this.btnCJ.color = StaticValue.WHITE;
         this.btnCJ.label = "成就领取";
         this.btnCJ.x = 135 + 242 - 71;
         this.btnCJ.y = 309 + 42 + 45 + 5;
         addChild(this.btnCJ);
         this.btnCJ.addEventListener(MouseEvent.CLICK,this.onClick);
         this.btnBuy = new NewButton();
         this.btnBuy.setPandding(8,2,18,10);
         this.btnBuy.setSkin("chunlianBtn");
         this.btnBuy.color = StaticValue.WHITE;
         this.btnBuy.label = "点击购买";
         this.btnBuy.x = 315 + 242 - 71;
         this.btnBuy.y = 309 + 42 + 45 + 5;
         addChild(this.btnBuy);
         this.btnBuy.addEventListener(MouseEvent.CLICK,this.onClick);
         this.btn = new NewButton();
         this.btn.x = 17 + 242 - 71;
         this.btn.y = 136 + 45 + 5;
         this.btn.label = "首页";
         this.btn.color = StaticValue.WHITE;
         addChild(this.btn);
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.btn1 = new NewButton();
         this.btn1.x = this.btn.x + this.btn.width + 1;
         this.btn1.y = this.btn.y;
         this.btn1.label = "vip1";
         this.btn1.color = StaticValue.WHITE;
         addChild(this.btn1);
         this.btn1.addEventListener(MouseEvent.CLICK,this.onClick);
         this.btn2 = new NewButton();
         this.btn2.x = this.btn1.x + this.btn1.width + 1;
         this.btn2.y = this.btn1.y;
         this.btn2.color = StaticValue.WHITE;
         this.btn2.label = "vip2";
         addChild(this.btn2);
         this.btn2.addEventListener(MouseEvent.CLICK,this.onClick);
         this.btn3 = new NewButton();
         this.btn3.x = this.btn2.x + this.btn2.width + 1;
         this.btn3.y = this.btn1.y;
         this.btn3.color = StaticValue.WHITE;
         this.btn3.label = "vip3";
         addChild(this.btn3);
         this.btn3.addEventListener(MouseEvent.CLICK,this.onClick);
         this.btn4 = new NewButton();
         this.btn4.x = this.btn3.x + this.btn3.width + 1;
         this.btn4.y = this.btn1.y;
         this.btn4.color = StaticValue.WHITE;
         this.btn4.label = "vip4";
         addChild(this.btn4);
         this.btn4.addEventListener(MouseEvent.CLICK,this.onClick);
         this.btn5 = new NewButton();
         this.btn5.x = this.btn4.x + this.btn4.width + 1;
         this.btn5.y = this.btn1.y;
         this.btn5.label = "vip5";
         this.btn5.color = StaticValue.WHITE;
         addChild(this.btn5);
         this.btn5.addEventListener(MouseEvent.CLICK,this.onClick);
         this.btn6 = new NewButton();
         this.btn6.x = this.btn5.x + this.btn5.width + 1;
         this.btn6.y = this.btn1.y;
         this.btn6.label = "vip6";
         addChild(this.btn6);
         this.btn6.color = StaticValue.WHITE;
         this.btn6.addEventListener(MouseEvent.CLICK,this.onClick);
         this.btn7 = new NewButton();
         this.btn7.x = this.btn6.x + this.btn6.width + 1;
         this.btn7.y = this.btn1.y;
         this.btn7.color = StaticValue.WHITE;
         this.btn7.label = "vip7";
         addChild(this.btn7);
         this.btn7.addEventListener(MouseEvent.CLICK,this.onClick);
         this.btn8 = new NewButton();
         this.btn8.x = this.btn7.x + this.btn7.width + 1;
         this.btn8.y = this.btn1.y;
         this.btn8.label = "vip8";
         this.btn8.color = StaticValue.WHITE;
         addChild(this.btn8);
         this.btn8.addEventListener(MouseEvent.CLICK,this.onClick);
         this.btn9 = new NewButton();
         this.btn9.x = this.btn8.x + this.btn8.width + 1;
         this.btn9.y = this.btn1.y;
         this.btn9.label = "vip9";
         this.btn9.color = StaticValue.WHITE;
         addChild(this.btn9);
         this.btn9.addEventListener(MouseEvent.CLICK,this.onClick);
         this.btn10 = new NewButton();
         this.btn10.x = this.btn9.x + this.btn9.width + 1;
         this.btn10.y = this.btn1.y;
         this.btn10.label = "vip10";
         this.btn10.color = StaticValue.WHITE;
         addChild(this.btn10);
         this.btn10.addEventListener(MouseEvent.CLICK,this.onClick);
         this.btn0 = new NewButton();
         this.btn0.x = this.btn10.x + this.btn10.width + 1;
         this.btn0.y = this.btn1.y;
         this.btn0.color = StaticValue.WHITE;
         this.btn0.label = "vip特权对比";
         addChild(this.btn0);
         this.btn0.addEventListener(MouseEvent.CLICK,this.onClick);
         this.closeBtn = new FSimpleButton();
         this.closeBtn.skin = "donghaibuyu_close_Button";
         addChild(this.closeBtn);
         this.closeBtn.x = 485 + 4 + 242 - 71 + 1 + 89;
         this.closeBtn.y = 10 + 11 + 45 + 5 + 3;
         this.closeBtn.addEventListener(MouseEvent.CLICK,this.onClose);
         this.spr_lv = new Sprite();
         this.spr_lv.x = 40 - 5 + 242 - 71;
         this.spr_lv.y = 80 + 3 + 45 + 5;
         addChild(this.spr_lv);
         this.cbarFT = new FTextArea();
         this.cbarFT.x = (this.sprcb.width - this.cbarFT.width) / 2;
         this.cbarFT.y = 0;
         this.cbarFT.textColor = StaticValue.WHITE;
         this.cbarFT.filters = StaticValue.filter;
         this.sprcb.addChild(this.cbarFT);
         this.yuanBaoFanHuanBtn = new NewSkinButton();
         this.yuanBaoFanHuanBtn.skin = "yuanbaofanhuanButton";
         this.yuanBaoFanHuanBtn.x = 650;
         this.yuanBaoFanHuanBtn.y = 331;
         this.yuanBaoFanHuanBtn.addEventListener(MouseEvent.CLICK,this.onYuanBaoFanHuiClick);
         this.jinPiaoFanHuanBtn = new NewSkinButton();
         this.jinPiaoFanHuanBtn.skin = "jinpiaofanhuanButton";
         this.jinPiaoFanHuanBtn.x = 650;
         this.jinPiaoFanHuanBtn.y = 367;
         this.jinPiaoFanHuanBtn.addEventListener(MouseEvent.CLICK,this.onJinPiaoFanHuiClick);
      }
      
      private function onClose(param1:MouseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function closevipHelp(param1:BaseEvent) : void
      {
         this.onShowLv(false);
      }
      
      public function onShowLv(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.helpCanvas.x == 247 + 242 - 71 + 93)
            {
               TweenMax.to(this.helpCanvas,1,{"x":519 + 242 - 71 + 93});
               this.tupoBo = true;
            }
         }
         else if(this.helpCanvas.x == 519 + 242 - 71 + 93)
         {
            TweenMax.to(this.helpCanvas,1,{"x":247 + 242 - 71 + 93});
            this.tupoBo = false;
         }
      }
      
      private function onYuanBaoFanHuiClick(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(UI_VIP_YUANBAOFANHUAN));
      }
      
      private function onJinPiaoFanHuiClick(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(UI_VIP_JINPIAOFANHUAN));
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:NewButton = param1.target as NewButton;
         if(this.curVipSpr)
         {
            this.curVipSpr.visible = false;
         }
         switch(param1.target)
         {
            case this.btn:
               this.curVipSpr = this.vip;
               this.vip_lv = -1;
               this.btnBuy.x = 315 + 242 - 71;
               this.btnCJ.visible = true;
               break;
            case this.btn1:
               this.curVipSpr = this.vip1;
               this.vip_lv = 1;
               this.btnBuy.x = width / 2 - 65;
               this.btnCJ.visible = false;
               break;
            case this.btn2:
               this.curVipSpr = this.vip2;
               this.vip_lv = 2;
               this.btnBuy.x = width / 2 - 65;
               this.btnCJ.visible = false;
               break;
            case this.btn3:
               this.curVipSpr = this.vip3;
               this.vip_lv = 3;
               this.btnBuy.x = width / 2 - 65;
               this.btnCJ.visible = false;
               break;
            case this.btn4:
               this.curVipSpr = this.vip4;
               this.vip_lv = 4;
               this.btnBuy.x = width / 2 - 65;
               this.btnCJ.visible = false;
               break;
            case this.btn5:
               this.curVipSpr = this.vip5;
               this.vip_lv = 5;
               this.btnBuy.x = width / 2 - 65;
               this.btnCJ.visible = false;
               break;
            case this.btn6:
               this.curVipSpr = this.vip6;
               this.vip_lv = 6;
               this.btnBuy.x = width / 2 - 65;
               this.btnCJ.visible = false;
               break;
            case this.btn7:
               this.curVipSpr = this.vip7;
               this.vip_lv = 7;
               this.btnBuy.x = width / 2 - 65;
               this.btnCJ.visible = false;
               break;
            case this.btn8:
               this.curVipSpr = this.vip8;
               this.vip_lv = 8;
               this.btnBuy.x = width / 2 - 65;
               this.btnCJ.visible = false;
               break;
            case this.btn9:
               this.curVipSpr = this.vip9;
               this.vip_lv = 9;
               this.btnBuy.x = width / 2 - 65;
               this.btnCJ.visible = false;
               break;
            case this.btn10:
               this.curVipSpr = this.vip10;
               this.vip_lv = 10;
               this.btnBuy.x = width / 2 - 65;
               this.btnCJ.visible = false;
               break;
            case this.btn0:
               this.curVipSpr = this.vip0;
               this.vip_lv = 0;
               this.btnBuy.x = width / 2 - 65;
               this.btnCJ.visible = false;
               break;
            case this.btnCJ:
               this.vip_lv = -1;
               dispatchEvent(new BaseEvent(UI_VIP_CHENGJIUBTN_CLICK,"",this.vip_lv));
               break;
            case this.btnBuy:
               dispatchEvent(new BaseEvent(UI_VIP_BUYBTN_CLICK));
               break;
            case this.btnHelp:
               dispatchEvent(new BaseEvent(UI_VIPGUIZE_CLOSE,"",1));
         }
         if(this.curVipSpr)
         {
            this.curVipSpr.visible = true;
         }
         this.btn.skin = this.btn0.skin = this.btn1.skin = this.btn2.skin = this.btn3.skin = this.btn4.skin = this.btn5.skin = this.btn6.skin = this.btn7.skin = this.btn8.skin = this.btn9.skin = this.btn10.skin = "newVIPLVButton";
         if(this.vip_lv != -1)
         {
            this["btn" + this.vip_lv].skin = "selectVIPLVButton";
         }
         else
         {
            this.btn.skin = "selectVIPLVButton";
         }
         if(this.vip_lv != -1)
         {
            this["scroll" + this.vip_lv].update();
            this.scroll0.visible = this.scroll1.visible = this.scroll2.visible = this.scroll3.visible = this.scroll4.visible = this.scroll5.visible = this.scroll6.visible = this.scroll7.visible = this.scroll8.visible = this.scroll9.visible = this.scroll10.visible = false;
            this["scroll" + this.vip_lv].visible = true;
         }
         else
         {
            this.scroll0.visible = this.scroll1.visible = this.scroll2.visible = this.scroll3.visible = this.scroll4.visible = this.scroll5.visible = this.scroll6.visible = this.scroll7.visible = this.scroll8.visible = this.scroll9.visible = this.scroll10.visible = false;
         }
      }
      
      private function mouseDowns(param1:MouseEvent) : void
      {
         this.parent.setChildIndex(this,parent.numChildren - 1);
         this.startDrag(false,new Rectangle(0,0,Tools.currentStage.stageWidth,Tools.currentStage.stageHeight));
      }
      
      private function mouseReleaseds(param1:MouseEvent) : void
      {
         this.stopDrag();
      }
      
      public function setInit(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Array, param7:int) : void
      {
         var _loc9_:Bitmap = null;
         var _loc10_:ItemFace = null;
         while(this.spr_lv.numChildren > 0)
         {
            this.spr_lv.removeChildAt(0);
         }
         this.LV = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/UIditu/VIP/vip" + param2 + ".swf",76,28);
         this.LV.x = 10;
         this.LV.y = 5;
         this.spr_lv.addChild(this.LV);
         if(param1 == 0)
         {
            this.LV.filters = Tools.blackWhiteFilter;
         }
         else
         {
            this.LV.filters = [];
         }
         this.btnCJ.enabled = param5;
         this.vip_lv = param2;
         this.cb.setValue(param3,param4);
         this.cbarFT.htmlText = param3 + "/" + param4;
         this.vip.visible = true;
         var _loc8_:int = 0;
         _loc8_ = 0;
         while(_loc8_ < 11)
         {
            this["vip" + _loc8_].visible = false;
            this["scroll" + _loc8_].visible = false;
            _loc8_++;
         }
         this.ftVIP.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>玩家VIP等级到达" + param7 + "级可领取以下VIP成就奖励：</font>";
         this.btn0.skin = this.btn1.skin = this.btn2.skin = this.btn3.skin = this.btn4.skin = this.btn5.skin = this.btn6.skin = this.btn7.skin = this.btn8.skin = this.btn9.skin = this.btn10.skin = "newVIPLVButton";
         this.btn.skin = "selectVIPLVButton";
         while(this.goodSpr.numChildren > 0)
         {
            this.goodSpr.removeChildAt(0);
         }
         _loc8_ = 0;
         while(_loc8_ < param6.length)
         {
            _loc9_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
            _loc9_.x = 13 + 50 * _loc8_;
            _loc9_.y = 8;
            this.goodSpr.addChild(_loc9_);
            _loc10_ = new ItemFace(new Goods(int(param6[_loc8_])));
            _loc10_.x = 15 + 50 * _loc8_;
            _loc10_.y = 10;
            this.goodSpr.addChild(_loc10_);
            _loc8_++;
         }
         this.btnBuy.x = 315 + 242 - 71;
         this.btnCJ.visible = true;
      }
   }
}

