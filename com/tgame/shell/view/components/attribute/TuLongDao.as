package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.alert.FAlert;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.event.FAlertEvent;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.ColorBar;
   import com.tgame.common.ui.componets.NewSkinButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.moudels.tulongdao.model.info.TuLongDaoVO;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import gs.TweenMax;
   
   public class TuLongDao extends Sprite
   {
      
      public static const UI_TULONGDAO_GUANBI_CLICK:String = "UI_TULONGDAO_GUANBI_CLICK";
      
      public var _$parent:DisplayObject;
      
      private var guanzhuBtn0:NewSkinButton;
      
      private var guanzhuBtn1:NewSkinButton;
      
      private var guanzhuBtn2:NewSkinButton;
      
      private var guanzhuBtn3:NewSkinButton;
      
      private var guanzhuBtn4:NewSkinButton;
      
      private var guanzhuBtn5:NewSkinButton;
      
      private var waixianBtn1:NewSkinButton;
      
      private var waixianBtn2:NewSkinButton;
      
      private var dangqidengji:int = 0;
      
      private var miaoshu:FTextArea;
      
      private var tulongzhi:FTextArea;
      
      private var shengjie0:Boolean = false;
      
      private var shengjie1:Boolean = false;
      
      private var shengjie2:Boolean = false;
      
      private var shengjie3:Boolean = false;
      
      private var shengjie4:Boolean = false;
      
      private var shengjie5:Boolean = false;
      
      private var shuxing0:FTextArea;
      
      private var shuxing1:FTextArea;
      
      private var shuxing2:FTextArea;
      
      private var shuxing3:FTextArea;
      
      private var shuxing4:FTextArea;
      
      private var shuxing5:FTextArea;
      
      private var tf:TextFormat;
      
      private var barBg1:Bitmap;
      
      private var barBar0:ColorBar;
      
      private var barBar1:ColorBar;
      
      private var barBar2:ColorBar;
      
      private var barBar3:ColorBar;
      
      private var barBar4:ColorBar;
      
      private var barBar5:ColorBar;
      
      private var isMainChar:Boolean;
      
      private var tulongdao:TuLongDaoTupoCanvas;
      
      private var nowId:int;
      
      private var lookingId:int;
      
      private var tupoBo:Boolean = false;
      
      private var bloodMc:MovieClip;
      
      private var mcObj:Array;
      
      private var bloodMcSpr:Sprite;
      
      private var helpBg:DisplayObject;
      
      private var Bg:DisplayObject;
      
      private var dengjiSpr:Sprite;
      
      private var dengjiXArr:Array;
      
      private var dengjiYArr:Array;
      
      private var dengJi0:DisplayObject;
      
      private var dengJi1:DisplayObject;
      
      private var dengJi2:DisplayObject;
      
      private var dengJi3:DisplayObject;
      
      private var dengJi4:DisplayObject;
      
      private var dengJi5:DisplayObject;
      
      private var jihuoBtn:NewSkinButton;
      
      private var jihuoObj:DisplayObject;
      
      private var jinengObj:DisplayObject;
      
      private var kuang:Bitmap;
      
      private var jihuoFt1:FTextArea;
      
      private var check1:FCheckBox;
      
      public function TuLongDao()
      {
         var ftz:FTextArea;
         var arrFt:Array;
         var n1:int;
         var n2:int;
         var i:int = 0;
         var $mask:Sprite = null;
         var ft:FTextArea = null;
         this.dengjiXArr = [];
         this.dengjiYArr = [];
         super();
         this.Bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/tulongdao/bg.swf");
         this.Bg.x = 0;
         this.Bg.y = 0;
         addChild(this.Bg);
         this.bloodMcSpr = new Sprite();
         this.bloodMcSpr.x = 12;
         this.bloodMcSpr.y = 0;
         addChild(this.bloodMcSpr);
         this.dengjiSpr = new Sprite();
         addChild(this.dengjiSpr);
         this.dengjiXArr = [74,275,74,275,74,275];
         this.dengjiYArr = [47,47,137,137,227,227];
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.miaoshu = new FTextArea();
         addChild(this.miaoshu);
         this.miaoshu.defaultTextFormat = this.tf;
         this.miaoshu.multiline = true;
         this.miaoshu.wordWrap = true;
         this.miaoshu.width = 380;
         this.miaoshu.x = 23;
         this.miaoshu.y = 20;
         ftz = new FTextArea();
         addChild(ftz);
         ftz.defaultTextFormat = this.tf;
         ftz.multiline = true;
         ftz.wordWrap = true;
         ftz.width = 30;
         ftz.htmlText = "<font color = \'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("注") + "</font>";
         ftz.x = 364;
         ftz.y = 329;
         ToolTips.createToolTips(ftz,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("1、玩家获取屠龙刀后，可使用屠龙之魂对屠龙刀进行神力灌注，以提升属性。") + "<br>" + LanResManager.getLanCommonTextWords("2、灌注达到满值后，可进行进阶操作，提升灌注上限。") + "<br>" + LanResManager.getLanCommonTextWords("3、六魄之力同时最低等阶达到 四、七、十三、十八层时，可以获得新的换装奖励。") + "<br>" + LanResManager.getLanCommonTextWords("4、玩家在线每30秒可获得一次屠龙之魂奖励，通关屠龙刀副本可获得刀魂丹奖励。") + "<br>";
            return _loc1_ + "</font></textformat>";
         });
         arrFt = [LanResManager.getLanCommonTextWords("腾蛇之妖"),LanResManager.getLanCommonTextWords("玄武之韧"),LanResManager.getLanCommonTextWords("白虎之力"),LanResManager.getLanCommonTextWords("青龙之光"),LanResManager.getLanCommonTextWords("朱雀之耀"),LanResManager.getLanCommonTextWords("勾陈之魂")];
         n1 = 0;
         n2 = 0;
         i = 0;
         while(i < 6)
         {
            if(i > 2)
            {
               n1 = i - 3;
               n2 = 1;
            }
            else
            {
               n1 = i;
               n2 = 0;
            }
            ft = new FTextArea();
            addChild(ft);
            ft.defaultTextFormat = this.tf;
            ft.multiline = true;
            ft.wordWrap = true;
            ft.width = 70;
            ft.htmlText = "<font size = \'12\' color = \'" + StaticValue.ORANGE_HTML + "\'>" + arrFt[i] + "</font>";
            ft.x = 7 + 325 * n2;
            ft.y = 47 + 90 * n1;
            i++;
         }
         this.shuxing0 = new FTextArea();
         addChild(this.shuxing0);
         this.shuxing0.defaultTextFormat = this.tf;
         this.shuxing0.multiline = true;
         this.shuxing0.wordWrap = true;
         this.shuxing0.width = 100;
         this.shuxing0.x = 65;
         this.shuxing0.y = 75;
         this.shuxing1 = new FTextArea();
         addChild(this.shuxing1);
         this.shuxing1.defaultTextFormat = this.tf;
         this.shuxing1.multiline = true;
         this.shuxing1.wordWrap = true;
         this.shuxing1.width = 100;
         this.shuxing1.x = 241;
         this.shuxing1.y = 75;
         this.shuxing2 = new FTextArea();
         addChild(this.shuxing2);
         this.shuxing2.defaultTextFormat = this.tf;
         this.shuxing2.multiline = true;
         this.shuxing2.wordWrap = true;
         this.shuxing2.width = 100;
         this.shuxing2.x = 65;
         this.shuxing2.y = 75 + 90;
         this.shuxing3 = new FTextArea();
         addChild(this.shuxing3);
         this.shuxing3.defaultTextFormat = this.tf;
         this.shuxing3.multiline = true;
         this.shuxing3.wordWrap = true;
         this.shuxing3.width = 100;
         this.shuxing3.x = 241;
         this.shuxing3.y = 75 + 90;
         this.shuxing4 = new FTextArea();
         addChild(this.shuxing4);
         this.shuxing4.defaultTextFormat = this.tf;
         this.shuxing4.multiline = true;
         this.shuxing4.wordWrap = true;
         this.shuxing4.width = 100;
         this.shuxing4.x = 65;
         this.shuxing4.y = 75 + 90 * 2;
         this.shuxing5 = new FTextArea();
         addChild(this.shuxing5);
         this.shuxing5.defaultTextFormat = this.tf;
         this.shuxing5.multiline = true;
         this.shuxing5.wordWrap = true;
         this.shuxing5.width = 100;
         this.shuxing5.x = 241;
         this.shuxing5.y = 75 + 90 * 2;
         this.guanzhuBtn0 = new NewSkinButton();
         this.guanzhuBtn0.skin = "tengsheButton";
         addChild(this.guanzhuBtn0);
         this.guanzhuBtn0.x = 10;
         this.guanzhuBtn0.y = 78;
         this.guanzhuBtn0.addEventListener(MouseEvent.CLICK,this.onClick);
         this.guanzhuBtn1 = new NewSkinButton();
         this.guanzhuBtn1.skin = "qinglongButton";
         addChild(this.guanzhuBtn1);
         this.guanzhuBtn1.x = 25 + 310;
         this.guanzhuBtn1.y = 78;
         this.guanzhuBtn1.addEventListener(MouseEvent.CLICK,this.onClick);
         this.guanzhuBtn2 = new NewSkinButton();
         this.guanzhuBtn2.skin = "xuanwuButton";
         addChild(this.guanzhuBtn2);
         this.guanzhuBtn2.x = 10;
         this.guanzhuBtn2.y = 78 + 90;
         this.guanzhuBtn2.addEventListener(MouseEvent.CLICK,this.onClick);
         this.guanzhuBtn3 = new NewSkinButton();
         this.guanzhuBtn3.skin = "zhuqueButton";
         addChild(this.guanzhuBtn3);
         this.guanzhuBtn3.x = 25 + 310;
         this.guanzhuBtn3.y = 78 + 90;
         this.guanzhuBtn3.addEventListener(MouseEvent.CLICK,this.onClick);
         this.guanzhuBtn4 = new NewSkinButton();
         this.guanzhuBtn4.skin = "baihuButton";
         addChild(this.guanzhuBtn4);
         this.guanzhuBtn4.x = 10;
         this.guanzhuBtn4.y = 78 + 90 * 2;
         this.guanzhuBtn4.addEventListener(MouseEvent.CLICK,this.onClick);
         this.guanzhuBtn5 = new NewSkinButton();
         this.guanzhuBtn5.skin = "gouchenButton";
         addChild(this.guanzhuBtn5);
         this.guanzhuBtn5.x = 25 + 310;
         this.guanzhuBtn5.y = 78 + 90 * 2;
         this.guanzhuBtn5.addEventListener(MouseEvent.CLICK,this.onClick);
         this.waixianBtn1 = new NewSkinButton();
         this.waixianBtn1.skin = "jingLeiQiangButton_1";
         addChild(this.waixianBtn1);
         this.waixianBtn1.x = 15 + 110 + 30;
         this.waixianBtn1.y = 70 + 80 * 2 + 100;
         this.waixianBtn1.addEventListener(MouseEvent.CLICK,this.onClick);
         this.waixianBtn2 = new NewSkinButton();
         this.waixianBtn2.skin = "jingLeiQiangButton_0";
         addChild(this.waixianBtn2);
         this.waixianBtn2.enabled = true;
         this.waixianBtn2.visible = false;
         this.waixianBtn2.x = 15 + 110 + 30;
         this.waixianBtn2.y = 70 + 80 * 2 + 100;
         this.waixianBtn2.addEventListener(MouseEvent.CLICK,this.onClick);
         i = 0;
         while(i < 3)
         {
            this.barBg1 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
            this.barBg1.width = 113;
            addChild(this.barBg1);
            this.barBg1.x = 10;
            this.barBg1.y = 130 + i * 90;
            i++;
         }
         i = 0;
         while(i < 3)
         {
            this.barBg1 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
            this.barBg1.width = 113;
            addChild(this.barBg1);
            this.barBg1.x = 80 + 185 + 12;
            this.barBg1.y = 130 + i * 90;
            i++;
         }
         this.barBar0 = new ColorBar(5,106,5);
         addChild(this.barBar0);
         this.barBar0.x = 10 + 4;
         this.barBar0.y = 3 + 130;
         this.barBar2 = new ColorBar(5,106,5);
         addChild(this.barBar2);
         this.barBar2.x = 10 + 4;
         this.barBar2.y = 3 + 130 + 90;
         this.barBar4 = new ColorBar(5,106,5);
         addChild(this.barBar4);
         this.barBar4.x = 10 + 4;
         this.barBar4.y = 3 + 130 + 90 * 2;
         this.barBar1 = new ColorBar(5,106,5);
         addChild(this.barBar1);
         this.barBar1.x = 80 + 4 + 185 + 12;
         this.barBar1.y = 3 + 130;
         this.barBar3 = new ColorBar(5,106,5);
         addChild(this.barBar3);
         this.barBar3.x = 80 + 4 + 185 + 12;
         this.barBar3.y = 3 + 130 + 90;
         this.barBar5 = new ColorBar(5,106,5);
         addChild(this.barBar5);
         this.barBar5.x = 80 + 4 + 185 + 12;
         this.barBar5.y = 3 + 130 + 90 * 2;
         this.tulongzhi = new FTextArea();
         addChild(this.tulongzhi);
         this.tulongzhi.defaultTextFormat = this.tf;
         this.tulongzhi.multiline = true;
         this.tulongzhi.wordWrap = true;
         this.tulongzhi.width = 130;
         this.tulongzhi.x = 5;
         this.tulongzhi.y = 335;
         this.tulongdao = new TuLongDaoTupoCanvas();
         addChild(this.tulongdao);
         this.tulongdao.x = 138;
         this.tulongdao.y = 0;
         $mask = new Sprite();
         $mask.mouseEnabled = false;
         addChild($mask);
         $mask.x = 410;
         $mask.y = -5;
         with($mask.graphics)
         {
            beginFill(16711680,0.5);
            drawRect(0,0,500,390);
            endFill();
         }
         this.tulongdao.mask = $mask;
         addEventListener(UI_TULONGDAO_GUANBI_CLICK,this.onCloseTupo);
         this.mcObj = new Array();
         this.jihuoBtn = new NewSkinButton();
         this.jihuoBtn.skin = "tulongjinjieButton";
         this.jihuoBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("屠龙刀隐藏属性未激活") + "<br>" + LanResManager.getLanCommonTextWords("屠龙刀全灌注达到满层的玩家可以点击此处激活屠龙刀隐藏属性。") + "</font>";
         this.jihuoBtn.x = 240;
         this.jihuoBtn.y = 25 + 30;
         this.jihuoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.jihuoObj = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/tulongdao/jinjieBg.swf");
         this.jihuoObj.x = 240;
         this.jihuoObj.y = 25 + 30;
         this.jihuoObj.visible = false;
         addChild(this.jihuoObj);
         ToolTips.createToolTips(this.jihuoObj,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("屠龙刀隐藏属性已激活") + "<br>" + LanResManager.getLanCommonTextWords("所有门派武学+6层") + "<br>" + LanResManager.getLanCommonTextWords("所有江湖武学+6层") + "<br>" + LanResManager.getLanCommonTextWords("所有帮派武学+6层") + "<br>" + LanResManager.getLanCommonTextWords("屠龙刀外观显示进阶为烈焰屠龙。");
            return _loc1_ + "</textformat></font>";
         });
         this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang);
         this.kuang.x = 211 - 2;
         this.kuang.y = 280 - 2;
         this.jinengObj = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/tulongdao/jinengBg.swf");
         this.jinengObj.x = 211;
         this.jinengObj.y = 280;
         this.jinengObj.visible = true;
         addChild(this.jinengObj);
         ToolTips.createToolTips(this.jinengObj,this,function():String
         {
            var _loc1_:String = "";
            if(dangqidengji < 4)
            {
               _loc1_ += "<font color=\'" + StaticValue.HUISE_HTML + "\'>" + LanResManager.getLanCommonTextWords("天刃") + "<br>" + LanResManager.getLanCommonTextWords("六魄之力同时最低等阶达到4级时，攻击对手有2%几率使其无法回血，持续10秒") + "<br>" + LanResManager.getLanCommonTextWords("破军") + "<br>" + LanResManager.getLanCommonTextWords("六魄之力同时最低等阶达到7级时， 攻击有几率令对手2段跳无法使用，持续10秒") + "<br>" + LanResManager.getLanCommonTextWords("失魂") + "<br>" + LanResManager.getLanCommonTextWords("六魄之力同时最低等阶达到13级时，攻击有很大几率震伤对手，使其无法使用技能，持续5秒") + "<br>" + LanResManager.getLanCommonTextWords("神威") + "<br>" + LanResManager.getLanCommonTextWords("六魄之力同时最低等阶达到18级时，攻击时5%几率触发神威，无视对手战纹效果，持续10秒") + "<br>";
               _loc1_ += "</font>";
            }
            else if(dangqidengji < 7)
            {
               _loc1_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("天刃") + "<br>" + LanResManager.getLanCommonTextWords("六魄之力同时最低等阶达到4级时，攻击对手有2%几率使其无法回血，持续10秒") + "<br></font>" + "<font color=\'" + StaticValue.HUISE_HTML + "\'>" + LanResManager.getLanCommonTextWords("破军") + "<br>" + LanResManager.getLanCommonTextWords("六魄之力同时最低等阶达到7级时， 攻击有几率令对手2段跳无法使用，持续10秒") + "<br>" + LanResManager.getLanCommonTextWords("失魂") + "<br>" + LanResManager.getLanCommonTextWords("六魄之力同时最低等阶达到13级时，攻击有很大几率震伤对手，使其无法使用技能，持续5秒") + "<br>" + LanResManager.getLanCommonTextWords("神威") + "<br>" + LanResManager.getLanCommonTextWords("六魄之力同时最低等阶达到18级时，攻击时5%几率触发神威，无视对手战纹效果，持续10秒") + "<br>";
               _loc1_ += "</font>";
            }
            else if(dangqidengji < 13)
            {
               _loc1_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("天刃") + "<br>" + LanResManager.getLanCommonTextWords("六魄之力同时最低等阶达到4级时，攻击对手有2%几率使其无法回血，持续10秒") + "<br>" + LanResManager.getLanCommonTextWords("破军") + "<br>" + LanResManager.getLanCommonTextWords("六魄之力同时最低等阶达到7级时， 攻击有几率令对手2段跳无法使用，持续10秒") + "<br></font>" + "<font color=\'" + StaticValue.HUISE_HTML + "\'>" + LanResManager.getLanCommonTextWords("失魂") + "<br>" + LanResManager.getLanCommonTextWords("六魄之力同时最低等阶达到13级时，攻击有很大几率震伤对手，使其无法使用技能，持续5秒") + "<br>" + LanResManager.getLanCommonTextWords("神威") + "<br>" + LanResManager.getLanCommonTextWords("六魄之力同时最低等阶达到18级时，攻击时5%几率触发神威，无视对手战纹效果，持续10秒") + "<br>";
               _loc1_ += "</font>";
            }
            else if(dangqidengji < 18)
            {
               _loc1_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("天刃") + "<br>" + LanResManager.getLanCommonTextWords("六魄之力同时最低等阶达到4级时，攻击对手有2%几率使其无法回血，持续10秒") + "<br>" + LanResManager.getLanCommonTextWords("破军") + "<br>" + LanResManager.getLanCommonTextWords("六魄之力同时最低等阶达到7级时， 攻击有几率令对手2段跳无法使用，持续10秒") + "<br>" + LanResManager.getLanCommonTextWords("失魂") + "<br>" + LanResManager.getLanCommonTextWords("六魄之力同时最低等阶达到13级时，攻击有很大几率震伤对手，使其无法使用技能，持续5秒") + "<br></font>" + "<font color=\'" + StaticValue.HUISE_HTML + "\'>" + LanResManager.getLanCommonTextWords("神威") + "<br>" + LanResManager.getLanCommonTextWords("六魄之力同时最低等阶达到18级时，攻击时5%几率触发神威，无视对手战纹效果，持续10秒") + "<br>";
               _loc1_ += "</font>";
            }
            else
            {
               _loc1_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("天刃") + "<br>" + LanResManager.getLanCommonTextWords("六魄之力同时最低等阶达到4级时，攻击对手有2%几率使其无法回血，持续10秒") + "<br>" + LanResManager.getLanCommonTextWords("破军") + "<br>" + LanResManager.getLanCommonTextWords("六魄之力同时最低等阶达到7级时， 攻击有几率令对手2段跳无法使用，持续10秒") + "<br>" + LanResManager.getLanCommonTextWords("失魂") + "<br>" + LanResManager.getLanCommonTextWords("六魄之力同时最低等阶达到13级时，攻击有很大几率震伤对手，使其无法使用技能，持续5秒") + "<br>" + LanResManager.getLanCommonTextWords("神威") + "<br>" + LanResManager.getLanCommonTextWords("六魄之力同时最低等阶达到18级时，攻击时5%几率触发神威，无视对手战纹效果，持续10秒") + "<br>";
               _loc1_ += "</font>";
            }
            return _loc1_;
         });
         this.jihuoFt1 = new FTextArea();
         this.jihuoFt1.x = 130;
         this.jihuoFt1.y = 45;
         this.jihuoFt1.textColor = StaticValue.GREEN;
         this.jihuoFt1.width = 100;
         this.jihuoFt1.height = 20;
         this.jihuoFt1.htmlText = LanResManager.getLanCommonTextWords("金毛狮王");
         this.jihuoFt1.visible = false;
         addChild(this.jihuoFt1);
         ToolTips.createToolTips(this.jihuoFt1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击+6666，防御+5666，生命+9999") + "<br>" + LanResManager.getLanCommonTextWords("特殊技能：攻击时有几率触发狮吼，使周围的敌对玩家移动速度降至10点，同") + "<br>" + LanResManager.getLanCommonTextWords("时天刃的触发几率提升至1.5倍。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.check1 = new FCheckBox();
         addChild(this.check1);
         this.check1.x = 210;
         this.check1.y = 45;
         this.check1.visible = false;
         this.check1.addEventListener(MouseEvent.CLICK,this.onCheckClick);
      }
      
      public static function getShuXing(param1:int) : String
      {
         switch(param1)
         {
            case 1:
               return LanResManager.getLanCommonTextWords("攻击");
            case 2:
               return LanResManager.getLanCommonTextWords("防御");
            case 3:
               return LanResManager.getLanCommonTextWords("生命");
            default:
               return "";
         }
      }
      
      public static function getColor(param1:int) : String
      {
         switch(param1)
         {
            case 1:
               return "#00ff00";
            case 2:
               return "#00ff00";
            case 3:
               return "#00ff00";
            case 4:
               return "#00ff00";
            case 5:
               return "#00ff00";
            case 6:
               return "#00ff00";
            case 7:
               return "#1e90ff";
            case 8:
               return "#1e90ff";
            case 9:
               return "#1e90ff";
            case 10:
               return "#1e90ff";
            case 11:
               return "#1e90ff";
            case 12:
               return "#1e90ff";
            case 13:
               return "#9933fa";
            case 14:
               return "#9933fa";
            case 15:
               return "#9933fa";
            case 16:
               return "#ff9912";
            case 17:
               return "#ff9912";
            case 18:
               return "#ff9912";
            case 19:
               return "#ff9912";
            default:
               return "";
         }
      }
      
      public static function getDengji(param1:int) : String
      {
         switch(param1)
         {
            case 1:
               return LanResManager.getLanCommonTextWords("（一层）");
            case 2:
               return LanResManager.getLanCommonTextWords("（二层）");
            case 3:
               return LanResManager.getLanCommonTextWords("（三层）");
            case 4:
               return LanResManager.getLanCommonTextWords("（四层）");
            case 5:
               return LanResManager.getLanCommonTextWords("（五层）");
            case 6:
               return LanResManager.getLanCommonTextWords("（六层）");
            case 7:
               return LanResManager.getLanCommonTextWords("（七层）");
            case 8:
               return LanResManager.getLanCommonTextWords("（八层）");
            case 9:
               return LanResManager.getLanCommonTextWords("（九层）");
            case 10:
               return LanResManager.getLanCommonTextWords("（十层）");
            case 11:
               return LanResManager.getLanCommonTextWords("（十一层）");
            case 12:
               return LanResManager.getLanCommonTextWords("（十二层）");
            case 13:
               return LanResManager.getLanCommonTextWords("（十三层）");
            case 14:
               return LanResManager.getLanCommonTextWords("（十四层）");
            case 15:
               return LanResManager.getLanCommonTextWords("（十五层）");
            case 16:
               return LanResManager.getLanCommonTextWords("（十六层）");
            case 17:
               return LanResManager.getLanCommonTextWords("（十七层）");
            case 18:
               return LanResManager.getLanCommonTextWords("（十八层）");
            case 19:
               return LanResManager.getLanCommonTextWords("满层");
            default:
               return "";
         }
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.check1:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_WUXINGBAOJIA_HUANZHUANG_CLICK,"",[1,SpecialGoodsID.TULONGDAO_JINMAOSHIWANG,this.check1.selectState]));
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var str:String = null;
         var e:MouseEvent = param1;
         switch(e.target)
         {
            case this.jihuoBtn:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_TULONGDAO_DAKAI_CLICK));
               break;
            case this.guanzhuBtn0:
               if(!this.shengjie0)
               {
                  str = "";
                  str = "<textformat leading=\'\'>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("您确定注入屠龙之魂？") + "<br></font></textformat>";
                  FAlert.okLabel = LanResManager.getLanCommonTextWords("继续");
                  FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
                  FAlert.show(str,"",2,function(param1:FAlertEvent):void
                  {
                     if(param1.eventData == FAlert.OK)
                     {
                        _$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_TULONGDAO_GUANZHU_CLICK,"",1));
                     }
                  });
               }
               else
               {
                  this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_TULONGDAO_XIULIAN_CLICK,"",1));
               }
               break;
            case this.guanzhuBtn1:
               if(!this.shengjie1)
               {
                  str = "";
                  str = "<textformat leading=\'\'>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("您确定注入屠龙之魂？") + "<br></font></textformat>";
                  FAlert.okLabel = LanResManager.getLanCommonTextWords("继续");
                  FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
                  FAlert.show(str,"",2,function(param1:FAlertEvent):void
                  {
                     if(param1.eventData == FAlert.OK)
                     {
                        _$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_TULONGDAO_GUANZHU_CLICK,"",2));
                     }
                  });
               }
               else
               {
                  this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_TULONGDAO_XIULIAN_CLICK,"",2));
               }
               break;
            case this.guanzhuBtn2:
               if(!this.shengjie2)
               {
                  str = "";
                  str = "<textformat leading=\'\'>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("您确定注入屠龙之魂？") + "<br></font></textformat>";
                  FAlert.okLabel = LanResManager.getLanCommonTextWords("继续");
                  FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
                  FAlert.show(str,"",2,function(param1:FAlertEvent):void
                  {
                     if(param1.eventData == FAlert.OK)
                     {
                        _$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_TULONGDAO_GUANZHU_CLICK,"",3));
                     }
                  });
               }
               else
               {
                  this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_TULONGDAO_XIULIAN_CLICK,"",3));
               }
               break;
            case this.guanzhuBtn3:
               if(!this.shengjie3)
               {
                  str = "";
                  str = "<textformat leading=\'\'>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("您确定注入屠龙之魂？") + "<br></font></textformat>";
                  FAlert.okLabel = LanResManager.getLanCommonTextWords("继续");
                  FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
                  FAlert.show(str,"",2,function(param1:FAlertEvent):void
                  {
                     if(param1.eventData == FAlert.OK)
                     {
                        _$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_TULONGDAO_GUANZHU_CLICK,"",4));
                     }
                  });
               }
               else
               {
                  this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_TULONGDAO_XIULIAN_CLICK,"",4));
               }
               break;
            case this.guanzhuBtn4:
               if(!this.shengjie4)
               {
                  str = "";
                  str = "<textformat leading=\'\'>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("您确定注入屠龙之魂？") + "<br></font></textformat>";
                  FAlert.okLabel = LanResManager.getLanCommonTextWords("继续");
                  FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
                  FAlert.show(str,"",2,function(param1:FAlertEvent):void
                  {
                     if(param1.eventData == FAlert.OK)
                     {
                        _$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_TULONGDAO_GUANZHU_CLICK,"",5));
                     }
                  });
               }
               else
               {
                  this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_TULONGDAO_XIULIAN_CLICK,"",5));
               }
               break;
            case this.guanzhuBtn5:
               if(!this.shengjie5)
               {
                  str = "";
                  str = "<textformat leading=\'\'>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("您确定注入屠龙之魂？") + "<br></font></textformat>";
                  FAlert.okLabel = LanResManager.getLanCommonTextWords("继续");
                  FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
                  FAlert.show(str,"",2,function(param1:FAlertEvent):void
                  {
                     if(param1.eventData == FAlert.OK)
                     {
                        _$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_TULONGDAO_GUANZHU_CLICK,"",6));
                     }
                  });
               }
               else
               {
                  this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_TULONGDAO_XIULIAN_CLICK,"",6));
               }
               break;
            case this.waixianBtn1:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_TULONGDAO_XIANSHI_CLICK,"",1));
               this.waixianBtn1.visible = false;
               this.waixianBtn2.visible = true;
               break;
            case this.waixianBtn2:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_TULONGDAO_XIANSHI_CLICK,"",0));
               this.waixianBtn1.visible = true;
               this.waixianBtn2.visible = false;
         }
      }
      
      private function onCloseTupo(param1:BaseEvent) : void
      {
         this.showTuPoPanel(false);
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this._$parent = param1;
         this.tulongdao._parent2 = param1;
         this.tulongdao._parent3 = this;
      }
      
      public function setinitilizeUI(param1:Boolean, param2:TuLongDaoVO) : void
      {
         this.setBg(param2.nowID);
         this.dangqidengji = param2.nowID;
         if(this.dangqidengji < 4)
         {
            this.jinengObj.filters = Tools.blackWhiteFilter;
         }
         else
         {
            this.jinengObj.filters = [];
         }
         this.miaoshu.htmlText = "<font color = \'" + StaticValue.GREEN_HTML + "\'>" + param2.MiaoShu + "</font>";
         this.tulongzhi.htmlText = "<font color = \'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("屠龙之魂：") + param2.tulongCount + "</font>";
         this.waixianBtn1.enabled = param2.xianShiBtn;
         if(param2.isWaiXian)
         {
            this.waixianBtn1.visible = false;
            this.waixianBtn2.visible = true;
            this.waixianBtn2.enabled = true;
         }
         else
         {
            this.waixianBtn1.visible = true;
            this.waixianBtn2.visible = false;
            this.waixianBtn2.enabled = true;
         }
         this.setShuXing(param2.TuLongArr);
         if(param2.isJiHuo)
         {
            this.jihuoObj.visible = true;
            this.jihuoBtn.visible = false;
         }
         else
         {
            this.jihuoObj.visible = false;
            this.jihuoBtn.visible = true;
         }
         this.check1.selectState = param2.check1;
         this.setJiHuo(param1);
      }
      
      private function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.jihuoFt1.visible = GameState.dictMainStatus[SpecialGoodsID.TULONGDAO_JINMAOSHIWANG];
            this.check1.visible = this.jihuoFt1.visible;
         }
         else
         {
            this.jihuoFt1.visible = false;
            this.check1.visible = false;
         }
      }
      
      private function setShuXing(param1:Array) : *
      {
         var _loc3_:String = null;
         var _loc4_:FTextArea = null;
         while(this.dengjiSpr.numChildren > 0)
         {
            this.dengjiSpr.removeChildAt(0);
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            this["guanzhuBtn" + String(_loc2_)].name = String(param1[_loc2_].biaoshi);
            if(!param1[_loc2_].guanzhu && !param1[_loc2_].jinjie)
            {
               this["guanzhuBtn" + String(_loc2_)].enabled = false;
            }
            this["barBar" + String(_loc2_)].setValue(param1[_loc2_].dangqianzhi,param1[_loc2_].zuidazhi);
            if(param1[_loc2_].dangqianzhi < param1[_loc2_].zuidazhi)
            {
               this["shengjie" + String(_loc2_)] = false;
            }
            else
            {
               this["shengjie" + String(_loc2_)] = true;
            }
            _loc3_ = "";
            if(param1[_loc2_].shuxing1 > 0)
            {
               _loc3_ += getShuXing(param1[_loc2_].shuxingbyte1) + "+" + param1[_loc2_].shuxing1 + "<br>";
            }
            else
            {
               _loc3_ += LanResManager.getLanCommonTextWords("未解封") + "<br>";
            }
            if(param1[_loc2_].shuxing2 > 0)
            {
               _loc3_ += getShuXing(param1[_loc2_].shuxingbyte2) + "+" + param1[_loc2_].shuxing2 + "<br>";
            }
            else
            {
               _loc3_ += LanResManager.getLanCommonTextWords("未解封") + "<br>";
            }
            if(param1[_loc2_].shuxing3 > 0)
            {
               _loc3_ += getShuXing(param1[_loc2_].shuxingbyte3) + "+" + param1[_loc2_].shuxing3 + "<br>";
            }
            else
            {
               _loc3_ += LanResManager.getLanCommonTextWords("未解封") + "<br>";
            }
            this["shuxing" + String(_loc2_)].htmlText = "<font color=\'" + getColor(param1[_loc2_].dengji) + "\'>" + _loc3_ + "</font>";
            _loc4_ = new FTextArea();
            this.dengjiSpr.addChild(_loc4_);
            _loc4_.defaultTextFormat = this.tf;
            _loc4_.multiline = true;
            _loc4_.wordWrap = true;
            _loc4_.width = 130;
            _loc4_.x = this.dengjiXArr[_loc2_] - 38;
            _loc4_.y = this.dengjiYArr[_loc2_] + 11;
            _loc4_.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'>" + getDengji(param1[_loc2_].dengji) + "</font >";
            _loc2_++;
         }
      }
      
      private function setBg(param1:int) : void
      {
         var mcId:int = 0;
         var loadUrl:String = null;
         var id:int = param1;
         mcId = 0;
         if(id < 4)
         {
            mcId = 1;
         }
         else if(id < 7)
         {
            mcId = 2;
         }
         else if(id < 13)
         {
            mcId = 3;
         }
         else if(id < 18)
         {
            mcId = 4;
         }
         else if(id < 20)
         {
            mcId = 5;
         }
         loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/tulongdao/" + mcId + ".swf";
         if(Boolean(this.bloodMc) && this.bloodMc.parent != null)
         {
            this.bloodMc.stop();
            this.bloodMc.parent.removeChild(this.bloodMc);
         }
         while(this.bloodMcSpr.numChildren > 0)
         {
            this.bloodMcSpr.removeChildAt(0);
         }
         if(this.mcObj[mcId] != null)
         {
            this.bloodMc = this.mcObj[mcId];
            this.bloodMc.play();
            this.bloodMcSpr.addChild(this.bloodMc);
         }
         else
         {
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               if(_loc2_.url.url != loadUrl)
               {
                  return;
               }
               if(Boolean(bloodMc) && bloodMc.parent != null)
               {
                  bloodMc.stop();
                  bloodMc.parent.removeChild(bloodMc);
               }
               while(bloodMcSpr.numChildren > 0)
               {
                  bloodMcSpr.removeChildAt(0);
               }
               bloodMc = _loc2_.content as MovieClip;
               mcObj[mcId] = bloodMc;
               if(bloodMc)
               {
                  bloodMcSpr.addChild(bloodMc);
               }
            },null,false,loadUrl);
         }
      }
      
      public function showTuPoPanel(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.tulongdao.x == 138)
            {
               TweenMax.to(this.tulongdao,1,{"x":410});
               this.tupoBo = true;
               this.guanzhuBtn0.enabled = false;
               this.guanzhuBtn1.enabled = false;
               this.guanzhuBtn2.enabled = false;
               this.guanzhuBtn3.enabled = false;
               this.guanzhuBtn4.enabled = false;
               this.guanzhuBtn5.enabled = false;
               this.waixianBtn1.enabled = false;
               this.waixianBtn2.enabled = false;
            }
         }
         else
         {
            if(this.tulongdao.x == 410)
            {
               TweenMax.to(this.tulongdao,1,{"x":138});
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_TULONGDAO_ZIDONGTISHENG_CLICK,"",false));
            }
            this.tupoBo = false;
            this.guanzhuBtn0.enabled = true;
            this.guanzhuBtn1.enabled = true;
            this.guanzhuBtn2.enabled = true;
            this.guanzhuBtn3.enabled = true;
            this.guanzhuBtn4.enabled = true;
            this.guanzhuBtn5.enabled = true;
            if(this.dangqidengji < 4)
            {
               this.waixianBtn1.enabled = false;
               this.waixianBtn2.enabled = false;
            }
            else
            {
               this.waixianBtn1.enabled = true;
               this.waixianBtn2.enabled = true;
            }
         }
      }
      
      public function isTupoCanvasShow() : Boolean
      {
         if(this.tulongdao.x == 410)
         {
            return true;
         }
         return false;
      }
      
      public function setTupoInit(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.tulongdao.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         if(param3 < 0)
         {
            param3 = 0;
         }
         this.tulongdao.setZhufuzhi(param1,param2,param3);
      }
      
      public function setGoods(param1:Goods, param2:Boolean) : void
      {
         this.tulongdao.setGoods(param1,param2);
      }
      
      public function setTuPoBtn(param1:Boolean) : void
      {
         this.tulongdao.setTuPoBtn(param1);
      }
      
      public function setEnableFun() : void
      {
         this.guanzhuBtn0.enabled = false;
         this.guanzhuBtn1.enabled = false;
         this.guanzhuBtn2.enabled = false;
         this.guanzhuBtn3.enabled = false;
         this.guanzhuBtn4.enabled = false;
         this.guanzhuBtn5.enabled = false;
         this.waixianBtn1.enabled = false;
         this.waixianBtn2.visible = false;
         this.waixianBtn1.visible = true;
      }
   }
}

