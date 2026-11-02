package com.tgame.shell.view.components
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.alert.FAlert;
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FAlertEvent;
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FTextArea;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ColorBar;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.FightManager;
   import com.tgame.shell.view.components.MeiRen.MeiRenList;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.loader.vo.LoadData;
   import com.zcp.common.utils.Fun;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   
   public class MeiRenPanel extends FPanel
   {
      
      public static const UI_SHOW_MEIRENPANEL:String = "UI_SHOW_MEIRENPANEL";
      
      public static const UI_MeiRenPanel_LIST_CLICK:String = "UI_MeiRenPanel_LIST_CLICK";
      
      public static const UI_MeiRenPanel_SHOW_MEIREN:String = "UI_MeiRenPanel_SHOW_MEIREN";
      
      public static const UI_MeiRenPanel_QINDIAN_CLICK:String = "UI_MeiRenPanel_QINDIAN_CLICK";
      
      public static const UI_MeiRenPanel_CHANMIAN_SHUXING_CLICK:String = "UI_MeiRenPanel_CHANMIAN_SHUXING_CLICK";
      
      public static const UI_MeiRenPanel_CHUZHAN_CLICK:String = "UI_MeiRenPanel_CHUZHAN_CLICK";
      
      public static const UI_MEIRENRESKILL_CLICK:String = "UI_MEIRENRESKILL_CLICK";
      
      public static const UI_MEIRENSKILLPANEL_CLICK:String = "UI_MEIRENSKILLPANEL_CLICK";
      
      public static const UI_MEIRENPANEL_EQUIP_CLICK:String = "UI_MEIRENPANEL_EQUIP_CLICK";
      
      private var ListRongqi:Sprite;
      
      private var List:FList;
      
      private var Scroll:FVScorllBar;
      
      private var bit:Bitmap;
      
      private var JingYan:ColorBar;
      
      private var lvTxt:FTextArea;
      
      private var btnSpr:Sprite;
      
      private var ChanMian:FSimpleButton;
      
      private var QinDian:FSimpleButton;
      
      private var ZengjiaShuxing:FTextArea;
      
      private var GongJi:FTextArea;
      
      private var FangYu:FTextArea;
      
      private var ShengMing:FTextArea;
      
      private var mr:String = "0";
      
      private var cs:String = "0";
      
      private var tb:String = "0";
      
      private var zuiduocs:String = "0";
      
      private var yijingcs:String = "0";
      
      private var zuidazhics:String = "0";
      
      private var arNum:Array;
      
      private var jineng:Sprite;
      
      private var value1:int = 0;
      
      private var tips:Sprite;
      
      private var tip:FTextArea;
      
      private var meirenvalue1:Number = 0;
      
      private var meirenvalue2:Number = 0;
      
      private var meirenvalue3:Number = 0;
      
      private var meirenvalue4:Number = 0;
      
      private var meirenvalue5:Number = 0;
      
      private var meirenvalue6:int = 0;
      
      private var shuxingAll:FTextArea;
      
      private var shuxingMC:FTextArea;
      
      private var ShiJu:FTextArea;
      
      private var MeirenJTShuxing:FTextArea;
      
      private var QinDianXuQiu:FTextArea;
      
      private var LV:int = 0;
      
      private var CaiLiao:String = " ";
      
      private var CaiLiaoShu:int;
      
      private var YuanBao:int;
      
      private var MeirenSpr:Sprite;
      
      private var QindianSpr:Sprite;
      
      private var ShuxingJiachengSpr:Sprite;
      
      private var BeijingtuSpr:Sprite;
      
      private var MerirenShuxingSpr:Sprite;
      
      private var JingQingQiDai:Sprite;
      
      private var mList:MeiRenList;
      
      private var gongMc:MovieClip;
      
      private var gongMcSpr:Sprite;
      
      private var loadUrl:String;
      
      private var hd1:Sprite;
      
      private var hd2:Sprite;
      
      private var hd3:Sprite;
      
      private var btn:FSimpleButton;
      
      private var mcObj:Array;
      
      private var mrArr:Array;
      
      private var cmMc:MovieClip;
      
      private var cmMcSpr:Sprite;
      
      private var cmMcArr:Array;
      
      private var cmMcArr1:Array;
      
      private var cmMcArr2:Array;
      
      private var cmMc1:MovieClip;
      
      private var cmMcSpr1:Sprite;
      
      private var cmMc2:MovieClip;
      
      private var cmMcSpr2:Sprite;
      
      private var MeirenXuqiu:DisplayObject;
      
      private var anjian:SecondButton;
      
      private var shuzi:int = 0;
      
      private var dituaaaa:DisplayObject;
      
      private var bg9:F9GridBitmap;
      
      private var ditumeiren:DisplayObject;
      
      private var lianzi:DisplayObject;
      
      private var lianziArr:Array;
      
      private var lianzi_open:DisplayObject;
      
      private var lianziOpenArr:Array;
      
      private var openMc:MovieClip;
      
      private var openMcSpr:Sprite;
      
      private var openMcArr:Array;
      
      private var gongMc1:MovieClip;
      
      private var loadUrl1:String;
      
      private var count:int = 0;
      
      private var selectMid:int = 0;
      
      private var yb:int = 0;
      
      private var reSkillBtnSpr:Sprite;
      
      private var reSkillBtn:SecondButton;
      
      private var reSkillID:int;
      
      private var reSkillPanel:MeiRenAllSkillPanel;
      
      private var zhuangbeiSpr:Sprite;
      
      private var arrCE:Array;
      
      private var zhuangbeiFengSpr:Sprite;
      
      private var zhuangbeiBit:Bitmap;
      
      public function MeiRenPanel()
      {
         var box1:FCanvas;
         var box2:FCanvas;
         var MeirenJingYan:DisplayObject;
         var MeirenShengji:FTextArea;
         var line:Bitmap;
         var MeirenJineng1:DisplayObject;
         var str:String;
         var zhongjian:DisplayObject = null;
         var MeirenJineng:DisplayObject = null;
         this.arNum = [];
         this.mcObj = [];
         this.mrArr = [];
         this.cmMcArr = [];
         this.cmMcArr1 = [];
         this.cmMcArr2 = [];
         this.lianziArr = [];
         this.arrCE = [];
         super();
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         width = 725;
         height = 522 + 20 + 7 - 35;
         titleText = LanResManager.getLanCommonTextWords("美人");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.mcObj = new Array();
         this.mrArr = new Array();
         MeiRenList.$parent = this;
         this.lianziOpenArr = new Array();
         this.lianziArr = new Array();
         this.openMcArr = new Array();
         this.cmMcArr = new Array();
         this.cmMcArr1 = new Array();
         this.cmMcArr2 = new Array();
         this.bg9 = Tools.get9GridBitmpByName("MRbackgroud");
         this.bg9.width = 710;
         this.bg9.height = 485 - 18;
         this.bg9.x = 8;
         this.bg9.y = 1;
         addChild(this.bg9);
         this.MeirenSpr = new Sprite();
         this.MeirenSpr.x = 0;
         this.MeirenSpr.y = 0;
         addChild(this.MeirenSpr);
         this.MeirenSpr.visible = true;
         this.QindianSpr = new Sprite();
         this.QindianSpr.x = 0;
         this.QindianSpr.y = 0;
         addChild(this.QindianSpr);
         this.QindianSpr.visible = true;
         this.ShuxingJiachengSpr = new Sprite();
         this.ShuxingJiachengSpr.x = 0;
         this.ShuxingJiachengSpr.y = 0;
         addChild(this.ShuxingJiachengSpr);
         this.ShuxingJiachengSpr.visible = true;
         this.BeijingtuSpr = new Sprite();
         this.BeijingtuSpr.x = 0;
         this.BeijingtuSpr.y = 2;
         addChild(this.BeijingtuSpr);
         this.BeijingtuSpr.visible = true;
         this.zhuangbeiBit = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.zhuangbeiBit.x = 660;
         this.zhuangbeiBit.y = 340;
         addChild(this.zhuangbeiBit);
         this.MerirenShuxingSpr = new Sprite();
         this.MerirenShuxingSpr.x = 0;
         this.MerirenShuxingSpr.y = 0;
         addChild(this.MerirenShuxingSpr);
         this.MerirenShuxingSpr.visible = true;
         this.JingQingQiDai = new Sprite();
         this.JingQingQiDai.x = 0;
         this.JingQingQiDai.y = 0;
         addChild(this.JingQingQiDai);
         this.JingQingQiDai.visible = true;
         this.tips = new Sprite();
         this.tips.x = 0;
         this.tips.y = 0;
         this.ShuxingJiachengSpr.addChild(this.tips);
         this.tips.visible = true;
         box1 = new FCanvas();
         box1.skin = "box";
         this.MerirenShuxingSpr.addChild(box1);
         box1.x = 475;
         box1.y = 385;
         box1.width = 235 + 5;
         box1.height = 75 + 5 + 5;
         box2 = new FCanvas();
         box2.skin = "box";
         this.MerirenShuxingSpr.addChild(box2);
         box2.x = 475;
         box2.y = 0 + 1 + 3;
         box2.width = 240;
         box2.height = 465 + 5 - 1 - 2;
         zhongjian = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/meiren/ditu_center.swf");
         zhongjian.visible = true;
         zhongjian.x = 195;
         zhongjian.y = 2 + 5 - 1 - 3;
         this.MeirenSpr.addChild(zhongjian);
         this.ditumeiren = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/meiren/ditumeiren.swf");
         this.ditumeiren.visible = true;
         this.ditumeiren.x = 195 + 30 + 33 - 8;
         this.ditumeiren.y = 2 + 5 - 1 - 3 + 30 + 36;
         this.MeirenSpr.addChild(this.ditumeiren);
         this.ListRongqi = new Sprite();
         with(this.ListRongqi)
         {
            x = 10;
            y = 0;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,185,466);
            graphics.endFill();
         }
         this.List = new FList();
         this.List.skin = "list1";
         this.List.itemRenderer = new MeiRenList();
         this.List.listWidth = 170;
         this.ListRongqi.addChild(this.List);
         this.List.x = 0;
         this.List.y = 0;
         this.List.addEventListener(MouseEvent.CLICK,this.onListClick);
         this.Scroll = new FVScorllBar(this.List,466);
         this.ListRongqi.addChild(this.Scroll);
         this.Scroll.x = 170 - 3;
         this.Scroll.y = 0;
         zhongjian = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/meiren/shangweikaiqi.swf");
         zhongjian.visible = true;
         zhongjian.x = 278 + 11;
         zhongjian.y = 419 - 6;
         this.JingQingQiDai.addChild(zhongjian);
         zhongjian = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/meiren/zengjiameirenchanmian.swf");
         zhongjian.visible = true;
         zhongjian.x = 360 - 95 - 5 - 5 - 5;
         zhongjian.y = 380 - 2 + 1;
         this.ShuxingJiachengSpr.addChild(zhongjian);
         this.shuxingAll = new FTextArea();
         this.ShuxingJiachengSpr.addChild(this.shuxingAll);
         this.shuxingAll.multiline = true;
         this.shuxingAll.autoSize = TextFieldAutoSize.LEFT;
         this.shuxingAll.wordWrap = true;
         this.shuxingAll.width = 120;
         this.shuxingAll.height = 20;
         this.shuxingAll.x = 205;
         this.shuxingAll.y = 405;
         this.shuxingAll.htmlText = "<font  color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前缠绵总加成") + "</font>";
         this.shuxingMC = new FTextArea();
         this.ShuxingJiachengSpr.addChild(this.shuxingMC);
         this.shuxingMC.multiline = true;
         this.shuxingMC.autoSize = TextFieldAutoSize.LEFT;
         this.shuxingMC.wordWrap = true;
         this.shuxingMC.width = 120;
         this.shuxingMC.height = 20;
         this.shuxingMC.x = 320 - 10;
         this.shuxingMC.y = 405;
         this.shuxingMC.htmlText = "<font  color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("本次缠绵加成") + "</font>";
         this.GongJi = new FTextArea();
         this.ShuxingJiachengSpr.addChild(this.GongJi);
         this.GongJi.multiline = true;
         this.GongJi.autoSize = TextFieldAutoSize.LEFT;
         this.GongJi.wordWrap = true;
         this.GongJi.width = 120;
         this.GongJi.height = 20;
         this.GongJi.x = 226 + 30 - 40 - 20 + 14;
         this.GongJi.y = 344 + 9 + 5 + 5 + 5 + 1 + 42 + 11;
         this.GongJi.htmlText = "<font  color=\'" + StaticValue.ORANGE_HTML + "\'></font>";
         this.FangYu = new FTextArea();
         this.ShuxingJiachengSpr.addChild(this.FangYu);
         this.FangYu.multiline = true;
         this.FangYu.autoSize = TextFieldAutoSize.LEFT;
         this.FangYu.wordWrap = true;
         this.FangYu.width = 120;
         this.FangYu.height = 20;
         this.FangYu.x = 226 + 30 - 40 - 20 + 14;
         this.FangYu.y = 344 + 9 + 5 + 5 + 5 + 10 + 5 + 42 + 11;
         this.FangYu.htmlText = "<font  color=\'" + StaticValue.ORANGE_HTML + "\'></font>";
         this.ShengMing = new FTextArea();
         this.ShuxingJiachengSpr.addChild(this.ShengMing);
         this.ShengMing.multiline = true;
         this.ShengMing.autoSize = TextFieldAutoSize.LEFT;
         this.ShengMing.wordWrap = true;
         this.ShengMing.width = 120;
         this.ShengMing.height = 20;
         this.ShengMing.x = 226 + 30 - 40 - 20 + 14;
         this.ShengMing.y = 344 + 9 + 5 + 5 + 5 + 20 + 10 + 42 + 11;
         this.ShengMing.htmlText = "<font  color=\'" + StaticValue.ORANGE_HTML + "\'></font>";
         this.tip = new FTextArea();
         this.tips.addChild(this.tip);
         this.tip.multiline = true;
         this.tip.autoSize = TextFieldAutoSize.LEFT;
         this.tip.wordWrap = true;
         this.tip.width = 90;
         this.tip.height = 30;
         this.tip.x = 320;
         this.tip.y = 344 + 9 + 5 + 5 + 5 - 1 + 2 + 42 + 11;
         this.tip.htmlText = "<font  color=\'" + StaticValue.ORANGE_HTML + "\'>+100<br>+200<br>+300<br></font>";
         this.ChanMian = new FSimpleButton();
         this.ShuxingJiachengSpr.addChild(this.ChanMian);
         this.ChanMian.x = 338 + 78 - 15;
         this.ChanMian.y = 387 + 12;
         this.ChanMian.skin = "mrchanmianButton";
         this.ChanMian.addEventListener(MouseEvent.CLICK,this.chanmianFun);
         this.ChanMian.enabled = true;
         this.QinDian = new FSimpleButton();
         this.QindianSpr.addChild(this.QinDian);
         this.QinDian.skin = "mrqindianButton";
         this.QinDian.height = 34;
         this.QinDian.width = 111;
         this.QinDian.x = 338 - 55;
         this.QinDian.y = 387 - 5 + 24 + 9 + 2;
         this.QinDian.addEventListener(MouseEvent.CLICK,this.qindianFun);
         this.QinDian.enabled = true;
         MeirenJineng = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/meiren/jineng.swf");
         MeirenJineng.visible = true;
         MeirenJineng.x = 560 - 10;
         MeirenJineng.y = 14 - 5;
         this.MerirenShuxingSpr.addChild(MeirenJineng);
         this.jineng = new Sprite();
         this.jineng.x = 0;
         this.jineng.y = 0;
         this.MerirenShuxingSpr.addChild(this.jineng);
         this.jineng.visible = true;
         this.bit = StaticValue.getBitmapByClassName("ui.char.dugu.lineBar");
         this.MerirenShuxingSpr.addChild(this.bit);
         this.bit.width = 240;
         this.bit.height = 20 + 2 + 5;
         this.bit.x = 475;
         this.bit.y = 256 - 15;
         MeirenJineng = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/meiren/meirenLV.swf");
         MeirenJineng.visible = true;
         MeirenJineng.x = 550;
         MeirenJineng.y = 3 + 3 + 107 + 15;
         this.MerirenShuxingSpr.addChild(MeirenJineng);
         MeirenJingYan = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/meiren/meirenshuxing.swf");
         MeirenJingYan.visible = true;
         MeirenJingYan.x = 560 - 10;
         MeirenJingYan.y = 265 - 5 - 15;
         this.MerirenShuxingSpr.addChild(MeirenJingYan);
         this.lvTxt = new FTextArea();
         this.lvTxt.x = 495;
         this.lvTxt.y = 190 - 5 - 20;
         this.lvTxt.htmlText = "LV:1";
         this.lvTxt.textColor = StaticValue.YELLOW;
         this.MerirenShuxingSpr.addChild(this.lvTxt);
         this.JingYan = new ColorBar(2,135,15);
         this.MerirenShuxingSpr.addChild(this.JingYan);
         this.JingYan.x = 551 - 5;
         this.JingYan.y = 190 - 20;
         this.JingYan.setValue(100,150);
         MeirenShengji = new FTextArea();
         this.MerirenShuxingSpr.addChild(MeirenShengji);
         MeirenShengji.multiline = true;
         MeirenShengji.autoSize = TextFieldAutoSize.LEFT;
         MeirenShengji.wordWrap = true;
         MeirenShengji.width = 230;
         MeirenShengji.height = 30;
         MeirenShengji.x = 511 - 35;
         MeirenShengji.y = 222 - 20 - 10;
         MeirenShengji.htmlText = "<font  color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("美人等级越高，美人属性越高") + "</font>";
         this.MeirenJTShuxing = new FTextArea();
         this.MerirenShuxingSpr.addChild(this.MeirenJTShuxing);
         this.MeirenJTShuxing.multiline = true;
         this.MeirenJTShuxing.autoSize = TextFieldAutoSize.LEFT;
         this.MeirenJTShuxing.wordWrap = true;
         this.MeirenJTShuxing.width = 150 + 50;
         this.MeirenJTShuxing.height = 30;
         this.MeirenJTShuxing.x = 520;
         this.MeirenJTShuxing.y = 298 - 16 - 15 + 12 + 10;
         this.MeirenJTShuxing.htmlText = "";
         line = StaticValue.getBitmapByClassName("ui.line");
         this.MerirenShuxingSpr.addChild(line);
         line.width = 240;
         line.x = 474;
         line.y = 139 - 17;
         this.ShiJu = new FTextArea();
         this.MerirenShuxingSpr.addChild(this.ShiJu);
         this.ShiJu.multiline = true;
         this.ShiJu.autoSize = TextFieldAutoSize.LEFT;
         this.ShiJu.wordWrap = true;
         this.ShiJu.width = 150 + 30;
         this.ShiJu.height = 30 + 30;
         this.ShiJu.x = 495 + 25 - 15;
         this.ShiJu.y = 390 - 5;
         this.ShiJu.htmlText = "<font  color=\'" + StaticValue.ORANGE_HTML + "\'>" + "美人卷珠帘，深坐颦蛾眉" + "<br>" + "但见泪痕湿，不知心恨谁" + "</font>";
         this.zhuangbeiFengSpr = new Sprite();
         this.zhuangbeiFengSpr.graphics.beginFill(16711680,0);
         this.zhuangbeiFengSpr.graphics.drawRect(0,0,50,50);
         this.zhuangbeiFengSpr.x = 660;
         this.zhuangbeiFengSpr.y = 340;
         this.MerirenShuxingSpr.addChild(this.zhuangbeiFengSpr);
         this.zhuangbeiFengSpr.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick,false,30);
         this.zhuangbeiFengSpr.visible = true;
         MeirenJineng1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/meiren/qindianditu.swf");
         MeirenJineng1.visible = true;
         MeirenJineng1.x = 475;
         MeirenJineng1.y = 0;
         this.BeijingtuSpr.addChild(MeirenJineng1);
         this.MeirenXuqiu = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/meiren/qindianxuqiu.swf");
         this.MeirenXuqiu.visible = true;
         this.MeirenXuqiu.x = 522;
         this.MeirenXuqiu.y = 312 + 20;
         this.BeijingtuSpr.addChild(this.MeirenXuqiu);
         this.QinDianXuQiu = new FTextArea();
         this.BeijingtuSpr.addChild(this.QinDianXuQiu);
         this.QinDianXuQiu.multiline = true;
         this.QinDianXuQiu.autoSize = TextFieldAutoSize.LEFT;
         this.QinDianXuQiu.wordWrap = true;
         this.QinDianXuQiu.width = 150 + 50;
         this.QinDianXuQiu.height = 30;
         this.QinDianXuQiu.x = 506;
         this.QinDianXuQiu.y = 330 + 20;
         this.QinDianXuQiu.htmlText = "";
         str = "";
         str += LanResManager.getLanCommonTextWords("已获得：") + "<br>";
         str += LanResManager.getLanCommonTextWords("角色等级：") + "<br>";
         str += LanResManager.getLanCommonTextWords("消耗材料：");
         str += LanResManager.getLanCommonTextWords("消耗元宝：") + "<br>";
         this.QinDianXuQiu.htmlText = "<font color = \'" + StaticValue.GOLD_HTML + "\'>" + str + "</font>";
         addEventListener(Event.ADDED_TO_STAGE,this.onAdd);
         this.gongMcSpr = new Sprite();
         this.gongMcSpr.x = 188;
         this.gongMcSpr.y = 15;
         addChild(this.gongMcSpr);
         this.gongMcSpr.mouseChildren = false;
         this.gongMcSpr.mouseEnabled = false;
         this.cmMcSpr = new Sprite();
         this.cmMcSpr.x = 240;
         this.cmMcSpr.y = 0;
         addChild(this.cmMcSpr);
         this.cmMcSpr1 = new Sprite();
         this.cmMcSpr1.x = 0;
         this.cmMcSpr1.y = 200;
         this.cmMcSpr2 = new Sprite();
         this.cmMcSpr2.x = 500;
         this.cmMcSpr2.y = 200;
         addChild(this.cmMcSpr2);
         this.openMcSpr = new Sprite();
         this.openMcSpr.x = 180;
         this.openMcSpr.y = 0;
         addChild(this.openMcSpr);
         this.setLianziOpen();
         this.hd1 = new Sprite();
         this.hd1.x = 300;
         this.hd1.y = 80 + 35;
         with(this.hd1.graphics)
         {
            beginFill(2003199,0);
            drawRect(0,0,150,320);
            endFill();
         }
         this.hd1.name = "hd1";
         this.hd1.height = 40;
         this.hd1.width = 40;
         addChild(this.hd1);
         this.hd1.addEventListener(MouseEvent.CLICK,this.mrClick);
         this.hd1.addEventListener(MouseEvent.MOUSE_OVER,this.mouseover);
         this.hd1.addEventListener(MouseEvent.MOUSE_OUT,this.mouseout);
         this.hd2 = new Sprite();
         this.hd2.x = 260 + 30;
         this.hd2.y = 110 + 35;
         with(this.hd2.graphics)
         {
            beginFill(2003199,0);
            drawRect(0,0,150,320);
            endFill();
         }
         this.hd2.name = "hd2";
         this.hd2.height = 70;
         this.hd2.width = 120;
         addChild(this.hd2);
         this.hd2.addEventListener(MouseEvent.CLICK,this.mrClick);
         this.hd2.addEventListener(MouseEvent.MOUSE_OVER,this.mouseover);
         this.hd2.addEventListener(MouseEvent.MOUSE_OUT,this.mouseout);
         this.hd3 = new Sprite();
         this.hd3.x = 270;
         this.hd3.y = 170 + 35;
         with(this.hd3.graphics)
         {
            beginFill(2003199,0);
            drawRect(0,0,150,320);
            endFill();
         }
         this.hd3.name = "hd3";
         this.hd3.height = 134;
         this.hd3.width = 134;
         addChild(this.hd3);
         this.hd3.addEventListener(MouseEvent.CLICK,this.mrClick);
         this.hd3.addEventListener(MouseEvent.MOUSE_OVER,this.mouseover);
         this.hd3.addEventListener(MouseEvent.MOUSE_OUT,this.mouseout);
         addChild(this.ListRongqi);
         addChild(this.cmMcSpr1);
         this.reSkillBtn = new SecondButton();
         this.reSkillBtn.label = LanResManager.getLanCommonTextWords("重置");
         this.reSkillBtn.x = 76;
         this.reSkillBtn.y = 30;
         this.reSkillBtn.visible = false;
         this.reSkillBtn.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         addChild(this.reSkillBtn);
      }
      
      public static function GetColor(param1:int) : int
      {
         var _loc2_:int = -1;
         switch(param1)
         {
            case 1:
               _loc2_ = StaticValue.WHITE;
               break;
            case 2:
               _loc2_ = StaticValue.BLUE;
               break;
            case 3:
               _loc2_ = StaticValue.GREEN;
               break;
            case 4:
               _loc2_ = StaticValue.PURPLE;
               break;
            case 5:
               _loc2_ = StaticValue.ORANGE;
         }
         return _loc2_;
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(UI_MEIRENPANEL_EQUIP_CLICK,"",param1));
      }
      
      private function onBtnClick(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(UI_MEIRENRESKILL_CLICK,"",this.List.selectItem.id));
         this.reSkillBtn.visible = false;
      }
      
      private function onReSkillBtnClick(param1:MouseEvent) : void
      {
         this.reSkillBtn.visible = !this.reSkillBtn.visible;
      }
      
      private function mrClick(param1:MouseEvent) : void
      {
         switch(param1.target.name)
         {
            case "hd1":
               this.setMR(this.List.selectItem.id,this.List.selectItem.index,1,this.arrCE.length);
               break;
            case "hd2":
               this.setMR(this.List.selectItem.id,this.List.selectItem.index,2,this.arrCE.length);
               break;
            case "hd3":
               this.setMR(this.List.selectItem.id,this.List.selectItem.index,3,this.arrCE.length);
         }
      }
      
      private function mouseover(param1:MouseEvent) : void
      {
         Mouse.cursor = MouseCursor.HAND;
      }
      
      private function mouseout(param1:MouseEvent) : void
      {
         Mouse.cursor = MouseCursor.AUTO;
      }
      
      private function onAdd(param1:Event) : void
      {
         this.reSkillBtn.visible = false;
         dispatchEvent(new BaseEvent(UI_SHOW_MEIRENPANEL));
      }
      
      private function onListClick(param1:MouseEvent) : void
      {
         var _loc3_:MeiRenList = null;
         var _loc4_:int = 0;
         var _loc5_:MeiRenList = null;
         this.selectMid = int(this.List.selectItem.id);
         var _loc2_:Array = this.List.getAllRenders();
         if(param1 != null)
         {
            switch(param1.target.name)
            {
               case "btn":
                  this.onListClick(null);
                  break;
               default:
                  for each(_loc3_ in _loc2_)
                  {
                     if(param1.target != _loc3_ && !Fun.isParentChild(_loc3_,param1.target as DisplayObject))
                     {
                        _loc3_.showChuzhanBtn(false,1);
                        if(_loc3_.reState() == 1)
                        {
                           _loc3_.showZhan(true);
                        }
                        else
                        {
                           _loc3_.showZhan(false);
                        }
                     }
                     else if(this.List.selectItem.mIsHave == 1)
                     {
                        if(this.List.selectItem.state == 1)
                        {
                           _loc3_.showChuzhanBtn(true,1);
                        }
                        else
                        {
                           _loc3_.showChuzhanBtn(true,2);
                        }
                        _loc3_.showZhan(false);
                     }
                     else
                     {
                        _loc3_.showChuzhanBtn(false,2);
                        if(this.List.selectItem.state == 1)
                        {
                           _loc3_.showZhan(true);
                        }
                        else
                        {
                           _loc3_.showZhan(false);
                        }
                     }
                  }
                  dispatchEvent(new BaseEvent(UI_MeiRenPanel_LIST_CLICK,"",[this.List.selectItem.id,this.List.selectItem.state,this.List.selectItem.index]));
            }
         }
         else
         {
            if(this.List.selectItem.id != "" && _loc2_.length > 0)
            {
               _loc2_[0].showChuzhanBtn(false,1);
               if(_loc2_[0].reState() == 1)
               {
                  _loc2_[0].showZhan(true);
               }
               else
               {
                  _loc2_[0].showZhan(false);
               }
            }
            _loc4_ = int(this.List.selectItem.index);
            _loc5_ = _loc2_[_loc4_] as MeiRenList;
            if(_loc5_.reMid() == int(this.List.selectItem.id))
            {
               if(this.List.selectItem.mIsHave == 1)
               {
                  if(this.List.selectItem.state == 1)
                  {
                     _loc5_.showChuzhanBtn(true,1);
                  }
                  else
                  {
                     _loc5_.showChuzhanBtn(true,2);
                  }
                  _loc5_.showZhan(false);
               }
               else
               {
                  _loc5_.showChuzhanBtn(false,1);
                  if(this.List.selectItem.state == 1)
                  {
                     _loc5_.showZhan(true);
                  }
                  else
                  {
                     _loc5_.showZhan(false);
                  }
               }
            }
         }
      }
      
      private function setListBtn() : void
      {
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         this.removeMc();
         while(this.gongMcSpr.numChildren)
         {
            this.gongMcSpr.removeChildAt(0);
         }
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function qindianFun(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         var str:String = "";
         str = "";
         if(this.yb > 0)
         {
            str = LanResManager.getLanTextWords(this,"请问您是否确定钦点该美人",[this.yb]);
         }
         else
         {
            str = LanResManager.getLanCommonTextWords("请问您是否确定钦点该美人？");
         }
         FAlert.okLabel = LanResManager.getLanCommonTextWords("确定");
         FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
         FAlert.show(str,"",2,function(param1:FAlertEvent):void
         {
            if(param1.eventData == FAlert.OK)
            {
               dispatchEvent(new BaseEvent(UI_MeiRenPanel_QINDIAN_CLICK,"",[List.selectItem.id,List.selectItem.index]));
            }
         });
      }
      
      private function chanmianFun(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(UI_MeiRenPanel_CHANMIAN_SHUXING_CLICK,"",[this.List.selectItem.id,this.List.selectItem.index]));
      }
      
      private function setLianziClose() : void
      {
         if(this.lianziArr.length != 0)
         {
            this.lianzi = this.lianziArr[0];
            this.lianzi.visible = true;
            this.lianzi.x = 195;
            this.lianzi.y = 2 + 5 - 1 - 3;
            addChild(this.lianzi);
         }
         else
         {
            this.lianzi = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/meiren/lianzi_close.swf");
            this.lianzi.visible = true;
            this.lianzi.x = 195;
            this.lianzi.y = 2 + 5 - 1 - 3;
            addChild(this.lianzi);
            this.lianziArr[0] = this.lianzi;
         }
      }
      
      private function setLianziOpen() : void
      {
         if(this.lianziOpenArr.length != 0)
         {
            this.lianzi_open = this.lianziOpenArr[0];
            this.lianzi_open.visible = true;
            this.lianzi_open.x = 195;
            this.lianzi_open.y = 2 + 5 - 1 - 3;
            addChild(this.lianzi_open);
         }
         else
         {
            this.lianzi_open = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/meiren/lianzi_open.swf");
            this.lianzi_open.visible = true;
            this.lianzi_open.x = 195;
            this.lianzi_open.y = 2 + 5 - 1 - 3;
            addChild(this.lianzi_open);
            this.lianziOpenArr[0] = this.lianzi_open;
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:ItemFace = param1.target as ItemFace;
         var _loc3_:Array = _loc2_.name.split(",");
         if(_loc3_ != null)
         {
            this.reSkillBtn.x = int(_loc3_[0]) - 5;
            this.reSkillBtn.y = int(_loc3_[1]) + 25;
            this.reSkillID = int(_loc3_[2]);
            this.reSkillBtn.visible = !this.reSkillBtn.visible;
         }
      }
      
      public function onShowList1(param1:XML, param2:int = 0) : void
      {
         this.List.dataProvider = param1;
         this.Scroll.update();
         if(param2 == -1)
         {
            param2 = 0;
         }
         this.List.setSelectItemByIndex(param2);
         this.setMR(this.List.selectItem.id,param2,0,this.arrCE.length);
         this.reSkillBtn.visible = false;
      }
      
      public function setShuXing(param1:String, param2:Number, param3:String, param4:Number, param5:String, param6:Number, param7:String, param8:int, param9:int, param10:int, param11:int, param12:int, param13:int = 0) : void
      {
         if(this.List.selectItem == null)
         {
            this.List.setSelectItemByIndex(0);
         }
         this.GongJi.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param1 + ":" + String(param2) + "</font>";
         this.FangYu.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param3 + ":" + String(param4) + "</font>";
         this.ShengMing.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param5 + ":" + String(param6) + "</font>";
         this.mr = "<font color = \'" + GetColor(this.List.selectItem.color) + "\'>" + param7 + "</font>";
         this.cs = "<font color = \'" + GetColor(this.List.selectItem.color) + "\'>" + String(param8) + "</font>";
         this.tb = "<font color = \'" + GetColor(this.List.selectItem.color) + "\'>" + String(param9) + "</font>";
         this.zuiduocs = "<font color = \'" + StaticValue.BlUE20_HTML + "\'>" + String(param10) + "</font>";
         this.yijingcs = "<font color = \'" + StaticValue.BlUE20_HTML + "\'>" + String(param11) + "</font>";
         this.zuidazhics = "<font color = \'" + StaticValue.BlUE20_HTML + "\'>" + String(param12) + "</font>";
         this.arNum[0] = param8;
         this.arNum[1] = param10;
         this.arNum[2] = param11;
         this.arNum[3] = param12;
         var _loc14_:String = "";
         if(param13 >= 1016)
         {
            _loc14_ = LanResManager.getLanTextWords(this,"点击缠绵可以与进行缠绵yb",[StaticValue.ORANGE_HTML,this.mr,StaticValue.ORANGE_HTML,StaticValue.ORANGE_HTML,this.mr,this.cs,StaticValue.ORANGE_HTML,this.mr,this.zuiduocs,StaticValue.ORANGE_HTML,this.mr,this.yijingcs,StaticValue.ORANGE_HTML,this.mr,this.zuidazhics,StaticValue.ORANGE_HTML,StaticValue.ORANGE_HTML,this.tb]);
         }
         else
         {
            _loc14_ = LanResManager.getLanTextWords(this,"点击缠绵可以与进行缠绵",[StaticValue.ORANGE_HTML,this.mr,StaticValue.ORANGE_HTML,StaticValue.ORANGE_HTML,this.mr,this.cs,StaticValue.ORANGE_HTML,this.mr,this.zuiduocs,StaticValue.ORANGE_HTML,this.mr,this.yijingcs,StaticValue.ORANGE_HTML,this.mr,this.zuidazhics,StaticValue.ORANGE_HTML,StaticValue.ORANGE_HTML,this.tb]);
         }
         this.ChanMian.toolTip = _loc14_;
      }
      
      public function setBenCi(param1:Number, param2:Number, param3:Number, param4:int) : void
      {
         this.tip.htmlText = "<font  color=\'" + StaticValue.ORANGE_HTML + "\'>+" + param1 + "<br>+" + param2 + "<br>+" + param3 + "<br></font>";
         if(param4 == 1)
         {
            this.tip.visible = true;
         }
         else
         {
            this.tip.visible = false;
         }
      }
      
      public function setMeiRenjineng(param1:Array, param2:int = 0) : void
      {
         var _loc3_:ItemFace = null;
         var _loc6_:Bitmap = null;
         var _loc8_:Skill = null;
         while(this.jineng.numChildren > 0)
         {
            this.jineng.removeChildAt(0);
         }
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc7_:int = 0;
         while(_loc7_ < 10)
         {
            if(_loc7_ < param1.length)
            {
               _loc6_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
               _loc6_.x = 466 + 55 + 39 * _loc4_ - 5 - 2 - 15 + 2;
               _loc6_.y = 32 + 2 + 40 * _loc5_;
               this.jineng.addChild(_loc6_);
               _loc8_ = param1[_loc7_] as Skill;
               _loc3_ = new ItemFace(_loc8_);
               _loc3_.showKungFuTag();
               _loc3_.setShowCount(false);
               _loc3_.x = 466 + 55 + 39 * _loc4_ - 5 - 2 - 15 + 2 + 2;
               _loc3_.y = 32 + 2 + 40 * _loc5_ + 2;
               _loc3_.name = _loc3_.x + "," + _loc3_.y + "," + _loc8_.id;
               _loc3_.addEventListener(MouseEvent.CLICK,this.onClick);
               this.jineng.addChild(_loc3_);
            }
            else if(_loc7_ < param2)
            {
               _loc6_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
               _loc6_.x = 466 + 55 + 39 * _loc4_ - 5 - 2 - 15 + 2;
               _loc6_.y = 32 + 2 + 40 * _loc5_;
               this.jineng.addChild(_loc6_);
            }
            else
            {
               _loc6_ = StaticValue.getBitmapByClassName("ui.ride.skill.assembled.skill.slot.lock");
               this.jineng.addChild(_loc6_);
               _loc6_.x = 466 + 55 + 39 * _loc4_ - 5 - 2 - 15 + 2;
               _loc6_.y = 32 + 2 + 40 * _loc5_;
            }
            if(++_loc4_ == 5)
            {
               _loc4_ = 0;
               _loc5_++;
            }
            _loc7_++;
         }
      }
      
      public function setChanMIAN(param1:Boolean) : void
      {
         if(param1)
         {
            this.ChanMian.enabled = true;
         }
         else
         {
            this.ChanMian.enabled = false;
         }
      }
      
      public function setExp(param1:int, param2:int, param3:int) : void
      {
         this.value1 = param2;
         this.JingYan.setValue(param2,param3);
         this.lvTxt.htmlText = "<font size=\'16\'>LV:" + String(param1) + "</font>";
      }
      
      public function setMeirenShuXing(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:String) : void
      {
         this.reSkillBtn.visible = false;
         this.meirenvalue1 = param1;
         this.meirenvalue2 = param2;
         this.meirenvalue3 = param3;
         this.meirenvalue4 = param4;
         this.meirenvalue5 = param5;
         this.meirenvalue6 = param6;
         this.MeirenJTShuxing.htmlText = "<textformat leading=\'3\'><font  color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("生命：") + this.meirenvalue1 + "" + "<br>" + LanResManager.getLanCommonTextWords("攻击：") + this.meirenvalue2 + "" + "<br>" + LanResManager.getLanCommonTextWords("暴击：") + this.meirenvalue4 + "" + "<br>" + LanResManager.getLanCommonTextWords("闪避：") + this.meirenvalue5 + "" + "</font></textformat>";
         this.ShiJu.htmlText = "<font color = \'" + StaticValue.YELLOW_HTML + "\'>" + param7 + "</font>";
      }
      
      public function setQinDian(param1:Boolean, param2:String, param3:Boolean, param4:int, param5:int, param6:Array, param7:Boolean, param8:int, param9:Boolean, param10:int, param11:Array) : void
      {
         var _loc14_:Object = null;
         var _loc15_:String = null;
         var _loc16_:Array = null;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc12_:String = "";
         var _loc13_:String = "";
         if(param1)
         {
            if(param11[0])
            {
               _loc13_ = StaticValue.GREEN_HTML;
            }
            else
            {
               _loc13_ = StaticValue.RED_HTML;
            }
            _loc12_ += "<font color=\'" + _loc13_ + "\'>" + LanResManager.getLanCommonTextWords("已获得：") + param2 + "</font><br>";
         }
         if(param3)
         {
            if(param11[1])
            {
               _loc13_ = StaticValue.GREEN_HTML;
            }
            else
            {
               _loc13_ = StaticValue.RED_HTML;
            }
            _loc12_ += "<font color=\'" + _loc13_ + "\'>" + LanResManager.getLanCommonTextWords("角色等级：") + String(param4) + "</font><br>";
         }
         if(param6.length > 0)
         {
            _loc15_ = param11[2] as String;
            _loc16_ = [];
            _loc16_ = _loc15_.split(",");
            _loc12_ += LanResManager.getLanCommonTextWords("消耗材料：");
            _loc17_ = 0;
            while(_loc17_ < param6.length)
            {
               _loc14_ = param6[_loc17_] as Object;
               _loc18_ = int(_loc16_[_loc17_]);
               if(_loc18_ == 1)
               {
                  _loc13_ = StaticValue.GREEN_HTML;
               }
               else
               {
                  _loc13_ = StaticValue.RED_HTML;
               }
               _loc12_ += "<font color=\'" + _loc13_ + "\'>" + _loc14_.name + "(" + _loc14_.num + ")</font><br>";
               _loc17_++;
            }
         }
         if(param7)
         {
            if(param11[3])
            {
               _loc13_ = StaticValue.GREEN_HTML;
            }
            else
            {
               _loc13_ = StaticValue.RED_HTML;
            }
            _loc12_ += "<font color=\'" + _loc13_ + "\'>" + LanResManager.getLanCommonTextWords("消耗铜币：") + String(param8) + "</font><br>";
         }
         if(param9)
         {
            if(param11[4])
            {
               _loc13_ = StaticValue.GREEN_HTML;
            }
            else
            {
               _loc13_ = StaticValue.RED_HTML;
            }
            _loc12_ += "<font color=\'" + _loc13_ + "\'>" + LanResManager.getLanCommonTextWords("消耗元宝：") + String(param10) + "</font><br>";
         }
         this.yb = param10;
         this.QinDianXuQiu.htmlText = "<font color = \'" + StaticValue.GOLD_HTML + "\'>" + _loc12_ + "</font>";
      }
      
      public function setRight(param1:int) : void
      {
         if(param1 == 0)
         {
            this.QindianSpr.visible = false;
            this.ShuxingJiachengSpr.visible = true;
            this.BeijingtuSpr.visible = false;
            this.MerirenShuxingSpr.visible = true;
            this.JingQingQiDai.visible = false;
            this.zhuangbeiFengSpr.visible = true;
            this.zhuangbeiBit.visible = true;
         }
         else if(param1 == 1)
         {
            this.QindianSpr.visible = true;
            this.ShuxingJiachengSpr.visible = false;
            this.BeijingtuSpr.visible = true;
            this.MerirenShuxingSpr.visible = false;
            this.JingQingQiDai.visible = false;
            this.zhuangbeiFengSpr.visible = false;
            this.zhuangbeiBit.visible = false;
         }
         else if(param1 == 2)
         {
            this.QindianSpr.visible = false;
            this.ShuxingJiachengSpr.visible = false;
            this.BeijingtuSpr.visible = true;
            this.MerirenShuxingSpr.visible = false;
            this.JingQingQiDai.visible = true;
            this.zhuangbeiFengSpr.visible = false;
            this.zhuangbeiBit.visible = false;
         }
         this.reSkillBtn.visible = false;
      }
      
      public function setListSelect(param1:int) : void
      {
         this.List.setSelectItemByIndex(param1);
      }
      
      public function setChuzhanBtn() : void
      {
         this.onListClick(null);
      }
      
      public function setMR(param1:int, param2:int, param3:int, param4:int = 0) : void
      {
         var playCloud:Function = null;
         var mid:int = param1;
         var index:int = param2;
         var hdIdex:int = param3;
         var ce:int = param4;
         ce = 1;
         if(this.mrArr[index] == null)
         {
            if(this.List.selectItem.kq == 1)
            {
               if(this.List.selectItem.mIsHave == 0)
               {
                  this.ditumeiren.visible = false;
                  this.setLianziClose();
               }
               else
               {
                  this.ditumeiren.visible = false;
                  if(this.lianzi)
                  {
                     this.lianzi.visible = false;
                  }
                  if(Boolean(this.lianzi) && Boolean(this.lianzi.parent))
                  {
                     this.lianzi.parent.removeChild(this.lianzi);
                  }
               }
               playCloud = function(param1:MovieClip):void
               {
                  var st:String = null;
                  var play_end1:Function = null;
                  var mc:MovieClip = param1;
                  if(mc)
                  {
                     play_end1 = function(param1:Event):void
                     {
                        if(param1.target.currentFrame == param1.target.totalFrames)
                        {
                           param1.target.removeEventListener(Event.ENTER_FRAME,play_end1);
                           if(hdIdex != 0)
                           {
                              removeMc();
                              while(gongMcSpr.numChildren > 0)
                              {
                                 gongMcSpr.removeChildAt(0);
                              }
                           }
                           if(hdIdex > 0 && hdIdex < 5)
                           {
                              hdIdex = 0;
                              LoadSwf.AndReturnMC(GameConfig.fileBaseFolder + "res/ui/meiren/" + mid + "_0.swf",playCloud);
                           }
                        }
                        else if(hdIdex == 0)
                        {
                           if(List.selectItem.mIsHave == 1)
                           {
                              hd1.mouseEnabled = true;
                              hd1.addEventListener(MouseEvent.CLICK,mrClick);
                              hd2.mouseEnabled = true;
                              hd2.addEventListener(MouseEvent.CLICK,mrClick);
                              hd3.mouseEnabled = true;
                              hd3.addEventListener(MouseEvent.CLICK,mrClick);
                           }
                           else
                           {
                              hd1.mouseEnabled = false;
                              hd1.removeEventListener(MouseEvent.CLICK,mrClick);
                              hd2.mouseEnabled = false;
                              hd2.removeEventListener(MouseEvent.CLICK,mrClick);
                              hd3.mouseEnabled = false;
                              hd3.removeEventListener(MouseEvent.CLICK,mrClick);
                           }
                        }
                        else
                        {
                           hd1.mouseEnabled = false;
                           hd1.removeEventListener(MouseEvent.CLICK,mrClick);
                           hd2.mouseEnabled = false;
                           hd2.removeEventListener(MouseEvent.CLICK,mrClick);
                           hd3.mouseEnabled = false;
                           hd3.removeEventListener(MouseEvent.CLICK,mrClick);
                        }
                     };
                     removeMc();
                     st = String(mid) + String(index);
                     gongMc = mc;
                     gongMc.stop();
                     gongMc.addEventListener(Event.ENTER_FRAME,play_end1);
                     gongMcSpr.addChild(gongMc);
                     gongMc.gotoAndPlay(1);
                  }
               };
               LoadSwf.AndReturnMC(GameConfig.fileBaseFolder + "res/ui/meiren/" + mid + "_" + hdIdex + ".swf",playCloud);
            }
            else
            {
               this.removeMc();
               this.ditumeiren.visible = true;
               this.hd1.mouseEnabled = false;
               this.hd1.removeEventListener(MouseEvent.CLICK,this.mrClick);
               this.hd2.mouseEnabled = false;
               this.hd2.removeEventListener(MouseEvent.CLICK,this.mrClick);
               this.hd3.mouseEnabled = false;
               this.hd3.removeEventListener(MouseEvent.CLICK,this.mrClick);
               if(Boolean(this.lianzi) && Boolean(this.lianzi.parent))
               {
                  this.lianzi.visible = true;
               }
               else
               {
                  this.setLianziClose();
               }
            }
         }
         else
         {
            this.mrArr[index] = mid;
         }
      }
      
      public function removeMc() : void
      {
         if(Boolean(this.gongMc) && this.gongMc.parent != null)
         {
            this.gongMc.stop();
            this.gongMc.parent.removeChild(this.gongMc);
            while(this.gongMcSpr.numChildren > 0)
            {
               this.gongMcSpr.removeChildAt(0);
            }
         }
         if(Boolean(this.cmMc) && this.cmMc.parent != null)
         {
            this.cmMc.stop();
            this.cmMc.parent.removeChild(this.cmMc);
            while(this.cmMcSpr.numChildren > 0)
            {
               this.cmMcSpr.removeChildAt(0);
            }
         }
      }
      
      private function com(param1:Event) : void
      {
         var _loc2_:LoadingItem = param1.target as LoadingItem;
         if(_loc2_.url.url != this.loadUrl1)
         {
            return;
         }
         if(this.gongMc1 != null && this.gongMc1.parent != null)
         {
            this.gongMc1.stop();
            this.gongMc1.parent.removeChild(this.gongMc1);
         }
         this.gongMc1 = _loc2_.content as MovieClip;
         this.mcObj[0] = this.gongMc1;
         if(this.gongMc1)
         {
            this.gongMc1.x = 240;
            this.gongMc1.y = 0;
            addChild(this.gongMc1);
         }
      }
      
      public function setCM() : void
      {
         var _loc1_:Array = null;
         if(this.gongMc1 != null && this.gongMc1.parent != null)
         {
            this.gongMc1.stop();
            this.gongMc1.parent.removeChild(this.gongMc1);
         }
         if(this.mcObj[0] != null)
         {
            this.gongMc1 = this.mcObj[0];
            if(this.gongMc1)
            {
               this.gongMc1.play();
               this.gongMc1.x = 240;
               this.gongMc1.y = 0;
               addChild(this.gongMc1);
            }
         }
         else
         {
            this.loadUrl1 = GameConfig.fileBaseFolder + "res/ui/meiren/chanmian.swf";
            _loc1_ = [new LoadData(this.loadUrl1,this.com,null,null,"","cm")];
            LoaderManager.load(_loc1_);
         }
      }
      
      public function lianziMc(param1:int) : void
      {
         var type:int = param1;
         var playCloud:Function = function(param1:MovieClip):void
         {
            var play_end1:Function = null;
            var mc:MovieClip = param1;
            if(mc)
            {
               play_end1 = function(param1:Event):void
               {
                  if(param1.target.currentFrame == 50)
                  {
                     setCM();
                     FightManager.screen_shake(2,60);
                     if(Boolean(gongMc) && Boolean(gongMc.parent))
                     {
                        gongMc.parent.removeChild(gongMc);
                     }
                  }
                  if(param1.target.currentFrame == 89)
                  {
                     if(Boolean(lianzi) && Boolean(lianzi.parent))
                     {
                        lianzi.parent.removeChild(lianzi);
                     }
                     setMR(List.selectItem.id,List.selectItem.index,0,arrCE.length);
                  }
                  if(param1.target.currentFrame == 125)
                  {
                     if(Boolean(gongMc1) && Boolean(gongMc1.parent))
                     {
                        gongMc1.stop();
                        gongMc1.parent.removeChild(gongMc1);
                     }
                  }
                  if(param1.target.currentFrame == param1.target.totalFrames)
                  {
                     param1.target.removeEventListener(Event.ENTER_FRAME,play_end1);
                     if(Boolean(openMc) && openMc.parent != null)
                     {
                        openMc.parent.removeChild(openMc);
                     }
                     ChanMian.enabled = true;
                  }
               };
               if(Boolean(openMc) && openMc.parent != null)
               {
                  openMc.stop();
                  openMc.parent.removeChild(openMc);
               }
               if(openMcArr.length == 0)
               {
                  openMc = mc;
                  openMcArr[0] = openMc;
               }
               else
               {
                  openMc = openMcArr[0];
               }
               openMc.stop();
               openMc.addEventListener(Event.ENTER_FRAME,play_end1);
               openMcSpr.addChild(openMc);
               if(type == 1)
               {
                  openMc.gotoAndStop(70);
               }
               else if(type == 2)
               {
                  ChanMian.enabled = false;
                  openMc.gotoAndPlay(1);
               }
               else if(type == 3)
               {
                  openMc.gotoAndPlay(70);
               }
            }
         };
         LoadSwf.AndReturnMC(GameConfig.fileBaseFolder + "res/ui/meiren/chuanglian_swf.swf",playCloud);
      }
      
      public function ShowMeiRenSkillPanel(param1:Array = null) : void
      {
         if(this.reSkillPanel == null)
         {
            this.reSkillPanel = new MeiRenAllSkillPanel();
            this.reSkillPanel.$parent = this;
         }
         this.reSkillPanel.visible = true;
         this.reSkillPanel.setJiNeng(param1);
         this.reSkillPanel.setOldSkill(this.reSkillID,this.List.selectItem.id);
         POPWindowManager.showWindow(this.reSkillPanel);
      }
      
      public function setItem(param1:Array) : void
      {
         var _loc2_:ItemFace = null;
         var _loc3_:Bitmap = null;
         this.arrCE = param1;
         while(this.zhuangbeiFengSpr.numChildren > 0)
         {
            this.zhuangbeiFengSpr.removeChildAt(0);
         }
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc2_ = new ItemFace(param1[_loc4_] as Goods);
            _loc2_.x = 2;
            _loc2_.y = 2;
            this.zhuangbeiFengSpr.addChild(_loc2_);
            _loc4_++;
         }
      }
   }
}

