package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.ReloginManager;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.utils.getDefinitionByName;
   
   public class WuXingZhiRen extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      private var fc1:FCanvas;
      
      public var bgImg:Bitmap;
      
      private var title:FTextArea;
      
      private var miaoshu:FTextArea;
      
      private var timerText:FLabel;
      
      private var linkMc:MovieClip;
      
      private var wuxingBtn:SimpleButton;
      
      private var container:Sprite;
      
      private var btn1:SimpleButton;
      
      private var $class:Class;
      
      private var selectBmp:Bitmap;
      
      private var selectSpr:Sprite;
      
      private var jihuoBtn:SecondButton;
      
      private var wuqiMc:MovieClip;
      
      private var isOthers:Boolean = true;
      
      private var xuanzhong:int;
      
      private var xuanZhongMc:SimpleButton;
      
      private var timerNum:int;
      
      private var staArr:Array;
      
      private var mcObj:Object;
      
      private var isShowApd:Boolean;
      
      private var tmpSpr:Sprite;
      
      private var check:FCheckBox;
      
      private var lb:FLabel;
      
      private var sprArray:*;
      
      private var qiehuan:WuXingZhiRenQieHuanPanel;
      
      private var img:Bitmap;
      
      private var item:ItemFace;
      
      private var goodsContainer:Sprite;
      
      private var numsOfJihuo:int;
      
      private var goodIdUsed:int = 0;
      
      private var mcArrowObj:Array;
      
      private var index:int = 0;
      
      private var isUse:Boolean;
      
      private var fts1:FTextArea;
      
      private var fts2:FTextArea;
      
      private var jinzhishi:int = 0;
      
      private var muzhishi:int = 0;
      
      private var shuizhishi:int = 0;
      
      private var huozhishi:int = 0;
      
      private var tuzhishi:int = 0;
      
      private var fts3:FTextArea;
      
      private var jinzhishu:int = 0;
      
      private var jinzhiyuan:int = 0;
      
      private var muzhishu:int = 0;
      
      private var muzhiyuan:int = 0;
      
      private var shuizhishu:int = 0;
      
      private var shuizhiyuan:int = 0;
      
      private var huozhishu:int = 0;
      
      private var huozhiyuan:int = 0;
      
      private var tuzhishu:int = 0;
      
      private var tuzhiyuan:int = 0;
      
      private var equipContainers:Sprite;
      
      private var isMain00:Boolean;
      
      private var kuangHD:Bitmap;
      
      private var kuangSpr:Sprite;
      
      private var kuangSpr2:Sprite;
      
      private var fts4:FTextArea;
      
      private var lianyaohu:Boolean = false;
      
      private var haotianchui:Boolean = false;
      
      private var linglongta:Boolean = false;
      
      private var sherigong:Boolean = false;
      
      private var donghuangzhong:Boolean = false;
      
      private var fts5:FTextArea;
      
      private var xuanyuanshi:int = 0;
      
      private var fts6:FTextArea;
      
      private var nvwashi:int = 0;
      
      private var fts7:FTextArea;
      
      private var fts8:FTextArea;
      
      private var mainSkillContainer:Sprite;
      
      private var currSkill:ItemFace;
      
      private var p:Point;
      
      private var mainSkillItemFace:ItemFace;
      
      private var mainSkill:Skill;
      
      private var kuang1:Bitmap;
      
      private var mainSkillItemFace2:ItemFace;
      
      private var kuang2:Bitmap;
      
      private var fts9:FTextArea;
      
      private var isLearn1:Boolean;
      
      private var isLearn2:Boolean;
      
      private var fts10:FTextArea;
      
      private var fts11:FTextArea;
      
      public var checkHz:FCheckBox;
      
      private var fts12:FTextArea;
      
      public var wuxingyinji:int = 0;
      
      private var equipContainers2:Sprite;
      
      public function WuXingZhiRen()
      {
         var tf1:TextFormat;
         var loadUrl:String;
         this.mcObj = {};
         this.mcArrowObj = [];
         super();
         this.fc1 = new FCanvas();
         this.fc1.x = 0;
         this.fc1.y = 0;
         this.fc1.width = 404;
         this.fc1.height = 365;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.bgImg = new Bitmap();
         this.bgImg.name = "ui.wuxingzhiren.bg.ui";
         addChild(this.bgImg);
         this.bgImg.x = 3;
         this.bgImg.y = 3;
         tf1 = new TextFormat();
         tf1.size = 18;
         this.title = new FTextArea();
         this.title.defaultTextFormat = tf1;
         this.title.textColor = StaticValue.ORANGE;
         this.title.filters = StaticValue.filter;
         this.title.htmlText = LanResManager.getLanCommonTextWords("五行之刃");
         this.title.x = 10;
         this.title.y = 5;
         addChild(this.title);
         this.miaoshu = new FTextArea();
         this.miaoshu.x = 10;
         this.miaoshu.y = 25;
         this.miaoshu.htmlText = "";
         this.miaoshu.autoSize = TextFieldAutoSize.LEFT;
         this.miaoshu.textColor = StaticValue.ORANGE;
         this.miaoshu.filters = StaticValue.filter;
         this.miaoshu.width = 370;
         this.miaoshu.wordWrap = true;
         addChild(this.miaoshu);
         this.timerText = new FLabel();
         this.timerText.x = 220;
         this.timerText.y = 10;
         this.timerText.textColor = StaticValue.RED;
         this.timerText.htmlText = "";
         addChild(this.timerText);
         this.selectSpr = new Sprite();
         this.selectSpr.mouseChildren = false;
         this.selectSpr.mouseEnabled = false;
         this.selectBmp = StaticValue.getBitmapByClassName("ui.wuxingzhiren.xuanzhong");
         this.selectSpr.addChild(this.selectBmp);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 200 - 20 + 5 + 2;
            y = 342;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("外观显示");
         }
         addChild(this.lb);
         this.check = new FCheckBox();
         addChild(this.check);
         this.check.x = 183 - 20 + 5 + 2;
         this.check.y = 340;
         this.check.enabled = false;
         this.check.addEventListener(MouseEvent.CLICK,this.onShowClick);
         this.check.name = LanResManager.getLanCommonTextWords("显示");
         loadUrl = GameConfig.fileBaseFolder + "res/data/mc/wuxingzhiren/line.swf";
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            linkMc = _loc2_.content as MovieClip;
            if(linkMc)
            {
               linkMc.gotoAndStop(1);
               linkMc.x = 175 + 20;
               linkMc.y = 90 + 20 - 5;
               linkMc.visible = false;
               addChildAt(linkMc,2);
            }
         },null,false,loadUrl);
         this.container = new Sprite();
         addChild(this.container);
         this.staArr = new Array();
         this.isOthers = false;
         this.sprArray = new Array();
         this.goodsContainer = new Sprite();
         this.goodsContainer.x = 177;
         this.goodsContainer.y = 240;
         ToolTips.createToolTips(this.goodsContainer,this,function(param1:*, param2:MouseEvent):String
         {
            var _loc4_:String = null;
            var _loc3_:String = "";
            _loc3_ += "<textformat leading=\'6\'>";
            var _loc5_:String = LanResManager.getLanCommonTextWords("神农鼎加成：攻击：6666 防御 2888 血量 28888");
            var _loc6_:String = numsOfJihuo + LanResManager.getLanCommonTextWords("把五行之刃合成属性：攻击：") + 6666 * numsOfJihuo;
            if(goodIdUsed == 306103)
            {
               _loc5_ = LanResManager.getLanCommonTextWords("无极?神农鼎") + "<br>" + LanResManager.getLanCommonTextWords("攻击1288888888 防御888888888 暴击2888 闪避2888 血量2088888888、所有武功提升1188层");
               _loc6_ = LanResManager.getLanCommonTextWords("五行无极技能：此技能将可以在PK时有几率触发，触发后将可造成对手在30秒内，无法对任何玩家进行攻击") + "，<br>" + LanResManager.getLanCommonTextWords("集齐五把五行之刃技能触发技能将大幅度提升（翻倍）。");
               _loc3_ += "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + _loc5_ + "<br>" + _loc6_ + "</font>";
            }
            else if(goodIdUsed == 371273)
            {
               _loc5_ = LanResManager.getLanCommonTextWords("邪龙眼") + "<br>" + LanResManager.getLanCommonTextWords("攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层");
               _loc6_ = LanResManager.getLanCommonTextWords("双击佩戴人物可拥有邪龙眼效果，攻击时有几率触发邪龙魅眼瞬间使对手石化且无法解脱，对手须受") + "，<br>" + "" + LanResManager.getLanCommonTextWords("到100%捶打之后方可解除，状态持续20秒") + "<br>" + LanResManager.getLanCommonTextWords("PK时有几率触发，触发后将可造成对手在30秒内，无法对任何玩家进行攻击，集齐五把五行之刃技能") + "<br>" + LanResManager.getLanCommonTextWords("触发几率将翻倍");
               _loc3_ += "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + _loc5_ + "<br>" + _loc6_ + "</font>";
            }
            else
            {
               if(goodIdUsed == 0)
               {
                  _loc5_ += "<br/>" + LanResManager.getLanCommonTextWords("最终·神农鼎加成：攻击：12222 防御 6888 血量 38888");
                  _loc6_ = "";
               }
               if(goodIdUsed == 306102)
               {
                  if(isUse)
                  {
                     _loc5_ = LanResManager.getLanCommonTextWords("最终·神农鼎(已强化)加成：攻击：312222 防御 6888 血量 38888");
                  }
                  else
                  {
                     _loc5_ = LanResManager.getLanCommonTextWords("最终·神农鼎加成：攻击：12222 防御 6888 血量 38888");
                  }
                  _loc6_ = numsOfJihuo + LanResManager.getLanCommonTextWords("把五行之刃合成属性：攻击：") + 12222 * numsOfJihuo;
               }
               _loc3_ += "<font color=\'" + (goodIdUsed == 0 ? StaticValue.HUISE_HTML : StaticValue.YELLOW_HTML) + "\'>" + _loc5_ + "</font><br>";
               if(numsOfJihuo > 0)
               {
                  _loc3_ += "<font color=\'" + (goodIdUsed == 0 ? StaticValue.HUISE_HTML : StaticValue.RED_HTML) + "\'>" + _loc6_ + "</font>";
               }
            }
            return _loc3_ + "</textformat>";
         });
         this.fts1 = new FTextArea();
         this.fts1.x = 10;
         this.fts1.y = 7 + 70;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 170;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("五行刃最终升级（已激活）");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("每激活一把五行之刃增加人物 攻击80000000000、防御60000000000、暴击8888、闪避8888、所有武功提升10000层") + "<br>" + LanResManager.getLanCommonTextWords("五行雷谴（特殊技能，佩戴五把五行刃并使用五行刃最终升级石方可激活该技能）：攻击时有几率触发五行雷谴，五行雷谴将必定随机触发任意一把五行刃的专属效果") + "——<br>" + LanResManager.getLanCommonTextWords("金之刃—金之光：触发后瞬间降低对手50%的总血量。") + "<br>" + LanResManager.getLanCommonTextWords("木之刃—木之森：触发后令对手被绿色光幕所遮蔽视线，大大影响战斗能力。") + "<br>" + LanResManager.getLanCommonTextWords("水之刃—水之寒：触发后令对手在5秒内无法使用任何攻击技能。") + "<br>" + LanResManager.getLanCommonTextWords("火之刃—火之焱：每秒降低对手15%的当前血量，持续时间1分钟。") + "<br>" + LanResManager.getLanCommonTextWords("土之刃—土之缚：触发后令对手定身5秒。") + "<br>";
            return _loc1_ + "</font></textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 10;
         this.fts2.y = 7 + 70 + 20;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 170;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("五行神兵激活秘籍（已激活）");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("双击使用后，可激活五行之刃的隐藏属性，每次可使用对应的五行之石×1进行加成，每次增加10亿攻击，武功1000层，每把上限500次") + "<br>" + LanResManager.getLanCommonTextWords("当前已使用") + jinzhishi + LanResManager.getLanCommonTextWords("颗金之石") + "<br>" + LanResManager.getLanCommonTextWords("当前已使用") + muzhishi + LanResManager.getLanCommonTextWords("颗木之石") + "<br>" + LanResManager.getLanCommonTextWords("当前已使用") + shuizhishi + LanResManager.getLanCommonTextWords("颗水之石") + "<br>" + LanResManager.getLanCommonTextWords("当前已使用") + huozhishi + LanResManager.getLanCommonTextWords("颗火之石") + "<br>" + LanResManager.getLanCommonTextWords("当前已使用") + tuzhishi + LanResManager.getLanCommonTextWords("颗土之石") + "<br>";
            return _loc1_ + "</font></textformat>";
         });
         this.kuangSpr = new Sprite();
         addChild(this.kuangSpr);
         this.kuangSpr2 = new Sprite();
         addChild(this.kuangSpr2);
         this.equipContainers = new Sprite();
         this.equipContainers.x = 295 - 288;
         this.equipContainers.y = 322 - 73 + 1 - 40 + 103;
         this.equipContainers2 = new Sprite();
         this.equipContainers2.x = 2;
         this.equipContainers2.y = 2;
         this.equipContainers2.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick000,false,30);
         this.equipContainers.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick00,false,30);
         addChild(this.equipContainers);
         addChild(this.equipContainers2);
         this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.kuangHD.x = 10;
         this.kuangHD.y = 266 - 2 - 1 - 10 - 40 + 103;
         this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.kuangSpr.addChild(this.kuangHD);
         this.kuangHD.x = 130 - 15;
         this.kuangHD.y = 131 - 20;
         this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.kuangSpr.addChild(this.kuangHD);
         this.kuangHD.x = 130 + 47 - 1;
         this.kuangHD.y = 131 + 25 + 130;
         this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.kuangSpr.addChild(this.kuangHD);
         this.kuangHD.x = 130 + 53 + 40 - 1 - 16 + 40;
         this.kuangHD.y = 131 - 20;
         this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.kuangSpr.addChild(this.kuangHD);
         this.kuangHD.x = 130 - 52;
         this.kuangHD.y = 131 + 75 + 32;
         this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.kuangSpr.addChild(this.kuangHD);
         this.kuangHD.x = 130 + 53 + 40 - 1 + 50;
         this.kuangHD.y = 131 + 75 + 32;
         this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.kuangSpr2.addChild(this.kuangHD);
         this.kuangHD.x = 127;
         this.kuangHD.y = 153;
         this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.kuangSpr2.addChild(this.kuangHD);
         this.kuangHD.x = 225;
         this.kuangHD.y = 153;
         this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.kuangSpr2.addChild(this.kuangHD);
         this.kuangHD.x = 177;
         this.kuangHD.y = 177;
         this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.kuangSpr2.addChild(this.kuangHD);
         this.kuangHD.x = 126;
         this.kuangHD.y = 226;
         this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.kuangSpr2.addChild(this.kuangHD);
         this.kuangHD.x = 177;
         this.kuangHD.y = 242;
         this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.kuangSpr2.addChild(this.kuangHD);
         this.kuangHD.x = 225;
         this.kuangHD.y = 226;
         this.kuangSpr2.visible = false;
         this.fts3 = new FTextArea();
         this.fts3.x = 10;
         this.fts3.y = 7 + 70 + 20 + 20;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 110;
         this.fts3.height = 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("五行神术（已激活）");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("提升属性：攻击10888888888888 防御8888888888888 血量12888888888888暴击 88888闪避88888   所有武功2000000层") + "<br>" + LanResManager.getLanCommonTextWords("★五行神术 —— 被攻击时有几率触发五行神术状态，在此状态下每累计6个负面状态将直接清除自身所有负面状态并恢复100%血量") + "<br>" + LanResManager.getLanCommonTextWords("且3秒内免疫所有负面状态，五行神术状态持续20秒！") + "<br>" + LanResManager.getLanCommonTextWords("★五行神术特殊属性：激活该神术后，将开启五行刃特殊属性，每把五行刃可灌注对应的五行之源(金之源、木之源、水之源、火之源、") + "<br>" + LanResManager.getLanCommonTextWords("土之源、)。每把五行刃可灌注350个。每个增加：攻击200亿，所有武功20000层。") + "<br>" + LanResManager.getLanCommonTextWords("当前已灌注") + jinzhiyuan + LanResManager.getLanCommonTextWords("颗金之源") + "<br>" + LanResManager.getLanCommonTextWords("增加：攻击") + jinzhiyuan * 200 + LanResManager.getLanCommonTextWords("亿  武功") + jinzhiyuan * 20000 + LanResManager.getLanCommonTextWords("层") + "<br>" + LanResManager.getLanCommonTextWords("当前已灌注") + muzhiyuan + LanResManager.getLanCommonTextWords("颗木之源") + "<br>" + LanResManager
            .getLanCommonTextWords("增加：攻击") + muzhiyuan * 200 + LanResManager.getLanCommonTextWords("亿  武功") + muzhiyuan * 20000 + LanResManager.getLanCommonTextWords("层") + "<br>" + LanResManager.getLanCommonTextWords("当前已灌注") + shuizhiyuan + LanResManager.getLanCommonTextWords("颗水之源") + "<br>" + LanResManager.getLanCommonTextWords("增加：攻击") + shuizhiyuan * 200 + LanResManager.getLanCommonTextWords("亿  武功") + shuizhiyuan * 20000 + LanResManager.getLanCommonTextWords("层") + "<br>" + LanResManager.getLanCommonTextWords("当前已灌注") + huozhiyuan + LanResManager.getLanCommonTextWords("颗火之源") + "<br>" + LanResManager.getLanCommonTextWords("增加：攻击") + huozhiyuan * 200 + LanResManager.getLanCommonTextWords("亿  武功") + huozhiyuan * 20000 + LanResManager.getLanCommonTextWords("层") + "<br>" + LanResManager.getLanCommonTextWords("当前已灌注") + tuzhiyuan + LanResManager.getLanCommonTextWords("颗土之源") + "<br>" + LanResManager.getLanCommonTextWords("增加：攻击") + tuzhiyuan * 200 + LanResManager.getLanCommonTextWords("亿  武功") + tuzhiyuan * 20000 + LanResManager
            .getLanCommonTextWords("层") + "<br>";
            return _loc1_ + "</font></textformat>";
         });
         this.fts4 = new FTextArea();
         this.fts4.x = 10;
         this.fts4.y = 7 + 70 + 20 + 20 + 20;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 100;
         this.fts4.height = 20;
         this.fts4.htmlText = LanResManager.getLanCommonTextWords("五神器（已激活）");
         this.fts4.visible = false;
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>";
            if(donghuangzhong)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("东皇钟") + "<br>" + LanResManager.getLanCommonTextWords("攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 120000层") + "<br>";
            }
            if(lianyaohu)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("炼妖壶") + "<br>" + LanResManager.getLanCommonTextWords("攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 120000层") + "<br>";
            }
            if(haotianchui)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("昊天锤") + "<br>" + LanResManager.getLanCommonTextWords("攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 120000层") + "<br>";
            }
            if(linglongta)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("玲珑塔") + "<br>" + LanResManager.getLanCommonTextWords("攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 120000层") + "<br>";
            }
            if(sherigong)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("射日弓") + "<br>" + LanResManager.getLanCommonTextWords("攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 120000层") + "<br>";
            }
            if(donghuangzhong && lianyaohu && haotianchui && linglongta && sherigong)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("同时佩戴五神器的玩家可激活最强隐藏心法—五神器封天技能") + "<br>" + LanResManager.getLanCommonTextWords("五神器封天（特殊技能）：攻击时100%触发五神器封天效果，在此效果内对手攻速，移速将降低") + "<br>" + LanResManager.getLanCommonTextWords("80%，无法被清除，持续30秒。且对手在此效果内无论移动或者攻击都将自断经脉无法在攻击任何") + "<br>" + LanResManager.getLanCommonTextWords("人，持续10秒，冷却60秒！");
            }
            return _loc1_ + "</font></textformat>";
         });
         this.fts5 = new FTextArea();
         this.fts5.x = 240;
         this.fts5.y = 7 + 70;
         this.fts5.textColor = StaticValue.GREEN;
         this.fts5.width = 170;
         this.fts5.height = 20;
         this.fts5.htmlText = LanResManager.getLanCommonTextWords("襄阳轩辕开封斧（已激活）");
         this.fts5.visible = false;
         addChild(this.fts5);
         ToolTips.createToolTips(this.fts5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("轩辕剑魄：攻击10888888889000 防御8288888889000 血量10088888889000 暴击108888闪避108888") + "<br>" + LanResManager.getLanCommonTextWords("所有武功2500000层") + "<br>" + LanResManager.getLanCommonTextWords("轩辕石：可用轩辕石为灵魂剑魄石进行强化，每次强化都将消耗1个轩辕石，每次强化都将获得15000") + "<br>" + LanResManager.getLanCommonTextWords("亿攻击、100000层武功，最多可升级100次.当升级满后可使灵魂剑魄石焕发全新超强外观及隐藏技能。") + "<br>" + LanResManager.getLanCommonTextWords("当前已使用") + xuanyuanshi + LanResManager.getLanCommonTextWords("颗轩辕石") + "<br>" + LanResManager.getLanCommonTextWords("增加攻击") + xuanyuanshi * 15000 + LanResManager.getLanCommonTextWords("亿，所有武功") + xuanyuanshi * 100000 + LanResManager.getLanCommonTextWords("层") + "<br>" + LanResManager.getLanCommonTextWords("★轩辕剑魄——激活襄阳轩辕剑魄且养成满的玩家，将可激活该隐藏属性--轩辕剑魄。被攻击时100%") + "<br>" + LanResManager.getLanCommonTextWords("召唤襄阳城剑魄附于自身，持续10秒。自身将灵魂出窍与剑魄合一，进行攻击。在此状态下对手将看") + "<br>" + LanResManager.getLanCommonTextWords("不到灵魂，且攻击时对手灵魂将被吸收掉80%血量，呆滞于原地无法移动。且自身的真身将在原地欺") + "<br>" + LanResManager
            .getLanCommonTextWords("骗对手。激活轩辕剑魄的玩家不管在跨服，城外，任何地点都可以与剑魄合体，冷却60秒！") + "<br>";
            return _loc1_ + "</font></textformat>";
         });
         this.fts6 = new FTextArea();
         this.fts6.x = 240;
         this.fts6.y = 7 + 70 + 20;
         this.fts6.textColor = StaticValue.GREEN;
         this.fts6.width = 170;
         this.fts6.height = 20;
         this.fts6.htmlText = LanResManager.getLanCommonTextWords("轩辕女娲石（已激活）");
         this.fts6.visible = false;
         addChild(this.fts6);
         ToolTips.createToolTips(this.fts6,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("轩辕女娲石：攻击10888888889000 防御8288888889000 血量10088888889000 暴击108888闪避108888") + "<br>" + LanResManager.getLanCommonTextWords("所有武功2500000层") + "<br>" + LanResManager.getLanCommonTextWords("女娲石碎片：可用女娲石碎片为灵魂轩辕剑进行强化，每次强化都将消耗1个女娲石碎片，每次强化都将获得15000亿攻击、") + "<br>" + LanResManager.getLanCommonTextWords("100000层武功，最多可升级100次.当升级满后可使灵魂轩辕剑焕发全新超强外观及隐藏技能") + "<br>" + LanResManager.getLanCommonTextWords("当前已使用") + nvwashi + LanResManager.getLanCommonTextWords("颗女娲石碎片") + "<br>" + LanResManager.getLanCommonTextWords("增加攻击") + nvwashi * 15000 + LanResManager.getLanCommonTextWords("亿，所有武功") + nvwashi * 100000 + LanResManager.getLanCommonTextWords("层") + "<br>" + LanResManager.getLanCommonTextWords("★轩辕女娲——女娲石是轩辕剑道具名，上古十大神器之一。相传女娲曾经为了救自己病故的爱女，将自己万年修为贯注于一") + "<br>" + LanResManager.getLanCommonTextWords("颗当年补天所剩的五彩玉石上，自此该灵石就具有特别之力。女娲石激活灵魂轩辕剑且养成满的玩家，将可激活该女娲特别之") + "<br>" + LanResManager.getLanCommonTextWords("力。攻击时100%触发女娲之力召唤上古天神—女锅，给自身形成一个神圣守护，无敌10秒；且在该BUFF期间每次攻击都必定将") + "<br>" + LanResManager
            .getLanCommonTextWords("对手击退到九宵云外且瞬间掉血80%，对手每次命中一次伤害，都将被打回原形全身属性下降剩1%，冷却60秒。") + "<br>";
            return _loc1_ + "</font></textformat>";
         });
         this.fts7 = new FTextArea();
         this.fts7.x = 240;
         this.fts7.y = 7 + 70 + 20 + 20;
         this.fts7.textColor = StaticValue.GREEN;
         this.fts7.width = 170;
         this.fts7.height = 20;
         this.fts7.htmlText = LanResManager.getLanCommonTextWords("落神秘籍（已激活）");
         this.fts7.visible = false;
         addChild(this.fts7);
         ToolTips.createToolTips(this.fts7,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击 68888亿、防御60888亿、血量80888亿、所有武功提升 880000层技能施") + "<br>" + LanResManager.getLanCommonTextWords("放速度提升5%") + "<br>" + LanResManager.getLanCommonTextWords("落神天罚：攻击时有几率触发落神天罚，持续10秒；在此状态下，每次攻击对手，对手都") + "<br>" + LanResManager.getLanCommonTextWords("将受到天罚的惩戒，瞬间倒地无法爬起移动；每次天罚一次对手，对手自身和旁边5格范围") + "<br>" + LanResManager.getLanCommonTextWords("内的所有玩家都将受到同等的惩罚瞬间掉血70%，且每受到一次天罚的伤害的对手都将失") + "<br>" + LanResManager.getLanCommonTextWords("去意识，头脑一片空白，无法正常操作，且攻击任何人都将失效。") + "<br>";
            return _loc1_ + "</font></textformat>";
         });
         this.fts8 = new FTextArea();
         this.fts8.x = 10 + 300;
         this.fts8.y = 10 + 205 + 123;
         this.fts8.textColor = StaticValue.GREEN;
         this.fts8.width = 170;
         this.fts8.height = 20;
         this.fts8.htmlText = LanResManager.getLanCommonTextWords("神剑冢(已激活)");
         addChild(this.fts8);
         ToolTips.createToolTips(this.fts8,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("万剑归宗：双击使用可立即触发万剑锁定玩家，对手命中该状态后，头顶将受到剑刃无数的穿") + "<br>" + LanResManager.getLanCommonTextWords("刺，每穿刺一次，对手所有勋章失效，且每命中一次，对手将瞬间掉血50%，命中万剑归宗的") + "<br>" + LanResManager.getLanCommonTextWords("玩家，所有技能都将被万剑封印，无法使用，持续5秒。冷却30秒。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts9 = new FTextArea();
         this.fts9.x = 10 + 300;
         this.fts9.y = 10 + 205 + 123 - 63;
         this.fts9.textColor = StaticValue.GREEN;
         this.fts9.width = 170;
         this.fts9.height = 20;
         this.fts9.htmlText = LanResManager.getLanCommonTextWords("剑寂(已激活)");
         addChild(this.fts9);
         ToolTips.createToolTips(this.fts9,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("剑寂：双击使用剑寂，从开而降一把红魔（神器）插在身边形成一祭剑阵，持续10秒。自身在") + "<br>" + LanResManager.getLanCommonTextWords("此状态下，将受到红魔（神器）的保护，不在受到任何攻击；当剑落入地上时，在红魔（神器）") + "<br>" + LanResManager.getLanCommonTextWords("的五格范围内所有玩家都将瞬间掉血50%；且在剑插下在地上的时间内，只要靠近红魔（神器）") + "<br>" + LanResManager.getLanCommonTextWords("的所有玩家，都将瞬间定身无法移动，持续5秒，冷却90秒（可在城里使用）") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts10 = new FTextArea();
         this.fts10.x = 10 + 300;
         this.fts10.y = 10 + 205 + 123 - 63 - 20;
         this.fts10.textColor = StaticValue.GREEN;
         this.fts10.width = 170;
         this.fts10.height = 20;
         this.fts10.htmlText = LanResManager.getLanCommonTextWords("无影千幻(已激活)");
         addChild(this.fts10);
         ToolTips.createToolTips(this.fts10,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("无影千幻：攻击时有几率触发无影千幻，持续15秒；在此状态下，每次被对手时都将立即触发五行剑阵，") + "<br>" + LanResManager.getLanCommonTextWords("自身将瞬间进入剑阵隐身，直到对手停止攻击才可显示。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.kuang1 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang1);
         this.kuang1.x = 25 + 324 - 340 + 340;
         this.kuang1.y = 160 + 35 - 186 + 220 + 65;
         this.kuang2 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang2);
         this.kuang2.x = 25 + 324 - 340 + 340;
         this.kuang2.y = 160 + 35 - 186 + 220 + 65 - 63;
         this.mainSkillContainer = new Sprite();
         this.mainSkillContainer.x = 25 + 2 + 324;
         this.mainSkillContainer.y = 160 + 2 + 35 - 186 + 220 + 65;
         addChild(this.mainSkillContainer);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onSkillMouseDown);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_UP,this.onSkillMouseUp);
         this.fts11 = new FTextArea();
         this.fts11.x = 10;
         this.fts11.y = 10 + 205 + 123 - 63 - 20 - 20;
         this.fts11.textColor = StaticValue.GREEN;
         this.fts11.width = 170;
         this.fts11.height = 20;
         this.fts11.htmlText = "蚩尤（战神）";
         addChild(this.fts11);
         ToolTips.createToolTips(this.fts11,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "蚩尤：蚩尤是上古时代九黎族部落酋长，神话中的武战神。" + "<br>" + "蚩尤神威：攻击时有几率触发蚩尤神威，持续10秒；在此状态下，神威发力如同" + "<br>" + "战神附体，每次攻击，对手的血量都将瞬间下降50% ；且在此状态下，天昏地暗，" + "<br>" + "鬼哭狼嚎，群魔出战，对手看不清前方，失去视野，且所有能力都将被封印，无" + "<br>" + "法施发，持续10秒。" + "<br></font>";
            return _loc1_ + "</textformat>";
         });
         this.checkHz = new FCheckBox();
         addChild(this.checkHz);
         this.checkHz.x = 83;
         this.checkHz.y = 10 + 205 + 123 - 63 - 20 - 20;
         this.checkHz.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts12 = new FTextArea();
         this.fts12.x = 10 + 300 - 45;
         this.fts12.y = 5 + 123 - 63 - 20 - 20 - 20;
         this.fts12.textColor = StaticValue.GREEN;
         this.fts12.width = 170;
         this.fts12.height = 20;
         this.fts12.htmlText = "五行封印（已激活）";
         addChild(this.fts12);
         ToolTips.createToolTips(this.fts12,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "攻击：106888亿、防御102888亿、血量100888亿、所有武功提升 880000层" + "<br>" + "特殊属性：激活五行封印的玩家，可以双击使用五行印记进行结印，每次结印消耗一个五行印记。" + "<br>" + "每次结印提升人物攻击1000亿，所有武功提升10000层，人物战力斗提升2亿（最多可使用500次）" + "<br>" + "特殊效果：五行封印由金、木、水、火、土五行共同组成，每个模块由8个禁制和1个封印构成。" + "<br>" + "金：当使用100个五行印记后完成金之封印" + "<br>" + "木：当使用200个五行印记后完成木之封印" + "<br>" + "水：当使用300个五行印记后完成水之封印" + "<br>" + "火：当使用400个五行印记后完成火之封印" + "<br>" + "土：当使用500个五行印记后完成土之封印" + "<br>" + "特殊技能：利用五行封印之力金、木、水、火、土来帮助施术者封印魔物，攻击时100%触发五行封印，" + "<br>" + "在此状态下，令对手不能爆发及控制内力，无法使用内力打出攻击和勋章技能。持续15秒，冷却９0秒。" + "<br>" + "当前已使用五行印记" + wuxingyinji + "颗" + "<br>" + "增加攻击" + wuxingyinji * 1000 + "亿，所有武功" + wuxingyinji * 10000 + "层，战斗力" + wuxingyinji * 2 + "亿" + "<br></font>";
            return _loc1_ + "</textformat>";
         });
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.checkHz:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkHz.selectState,113]));
         }
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_WUXINGZHIREN_PANEL_SHOW_MENU,"",[this.item.getBaseItem().id,param1]));
      }
      
      private function setWuXingSta() : void
      {
         var i:int;
         var str:String = null;
         var mcArrow:MovieClip = null;
         var loadArrowUrl:String = null;
         var loadUrl:String = null;
         this.sprArray = null;
         this.sprArray = new Array();
         while(this.container.numChildren > 0)
         {
            this.container.removeChildAt(0);
         }
         if(this.linkMc != null)
         {
            this.linkMc.visible = false;
            this.linkMc.mouseChildren = false;
            this.linkMc.mouseEnabled = false;
            this.linkMc.stop();
         }
         if(this.xuanzhong > 0 && !this.isOthers)
         {
            this.check.enabled = true;
         }
         this.numsOfJihuo = 0;
         i = 0;
         while(i < this.staArr.length)
         {
            this.tmpSpr = new Sprite();
            this.tmpSpr.name = "" + i;
            if(this.staArr[i].zhuangtai == 0)
            {
               str = "ui.char.wuxingzhiren.btn.hui." + (i + 1);
               this.$class = getDefinitionByName(str) as Class;
               this.wuxingBtn = new this.$class() as SimpleButton;
               this.tmpSpr.addChild(this.wuxingBtn);
               this.wuxingBtn.name = "" + i;
               if(!this.isOthers)
               {
                  this.jihuoBtn = new SecondButton();
                  this.jihuoBtn.label = LanResManager.getLanCommonTextWords("激活");
                  this.jihuoBtn.name = "" + i;
                  this.jihuoBtn.x = -2;
                  this.jihuoBtn.y = 50 - 5 + 10;
                  this.tmpSpr.addChild(this.jihuoBtn);
                  if(ReloginManager.isInKuafu)
                  {
                     this.jihuoBtn.enabled = false;
                  }
                  else
                  {
                     this.jihuoBtn.addEventListener(MouseEvent.CLICK,this.onJiHuoClick);
                  }
               }
               if(this.mcArrowObj[i] != null)
               {
                  mcArrow = this.mcArrowObj[i];
                  mcArrow.stop();
                  mcArrow.visible = false;
               }
            }
            else
            {
               ++this.numsOfJihuo;
               str = "ui.char.wuxingzhiren.btn.liang." + (i + 1);
               this.$class = getDefinitionByName(str) as Class;
               this.wuxingBtn = new this.$class() as SimpleButton;
               this.tmpSpr.addChild(this.wuxingBtn);
               this.wuxingBtn.addEventListener(MouseEvent.CLICK,this.onBtnClick);
               this.wuxingBtn.name = "" + i;
               if(this.goodIdUsed > 0)
               {
                  loadArrowUrl = GameConfig.fileBaseFolder + "res/data/mc/wuxingzhiren/arrow" + (i + 1) + ".swf";
                  if(this.mcArrowObj[i] != null)
                  {
                     mcArrow = this.mcArrowObj[i];
                     this.container.addChild(mcArrow);
                     mcArrow.play();
                     mcArrow.visible = true;
                  }
                  else
                  {
                     LoaderManager.lazyLoad(this.onLoadCallBack,null,false,loadArrowUrl);
                  }
               }
            }
            ToolTips.createToolTips(this.wuxingBtn,this,function(param1:*, param2:MouseEvent):String
            {
               var _loc6_:String = null;
               var _loc3_:String = param2.currentTarget.name;
               var _loc4_:int = Number(_loc3_);
               var _loc5_:String = "";
               var _loc7_:String = "";
               if(staArr[_loc4_].zhuangtai == 0)
               {
                  _loc6_ = "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("未激活") + "</font>";
                  _loc7_ = "<font color=\'" + StaticValue.RED_HTML + "\'>" + "【" + LanResManager.getLanCommonTextWords("未淬炼") + "】" + "</font>";
               }
               else
               {
                  _loc6_ = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("已激活") + "</font>";
                  if(staArr[_loc4_].cuilian)
                  {
                     _loc7_ = "<font color=\'" + StaticValue.RED_HTML + "\'>" + "【" + LanResManager.getLanCommonTextWords("已淬炼") + "】" + "</font>";
                  }
                  else
                  {
                     _loc7_ = "<font color=\'" + StaticValue.RED_HTML + "\'>" + "【" + LanResManager.getLanCommonTextWords("未淬炼") + "】" + "</font>";
                  }
               }
               _loc5_ += "<textformat leading=\'6\'>";
               _loc5_ = _loc5_ + ("<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("五行属性") + "：</font>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>[" + staArr[_loc4_].name + "]</font>" + _loc7_ + "<br>");
               _loc5_ = _loc5_ + ("<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("激活状态") + "：</font>[" + _loc6_ + "]<br>");
               _loc5_ = _loc5_ + ("<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("相克属性") + "：</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + staArr[_loc4_].xkshuxing + "</font><br>");
               _loc5_ = _loc5_ + ("<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("属性说明") + "：</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + staArr[_loc4_].sxshuoming + "</font><br>");
               _loc5_ = _loc5_ + ("<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("人物属性加成") + "：</font>" + "<br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：") + staArr[_loc4_].gongji + "</font>" + "<br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("防御：") + staArr[_loc4_].fangyu + "</font>" + "<br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("生命：") + staArr[_loc4_].shengming + "</font>" + "<br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("武功层数：") + staArr[_loc4_].wugong + "</font>");
               if(isOthers)
               {
                  if(GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHIREN_JINZHISHU_MIJI_ID] == 1 && staArr[_loc4_].id == 2)
                  {
                     _loc5_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'><br>" + LanResManager.getLanCommonTextWords("金之书秘籍：") + "<br>" + LanResManager.getLanCommonTextWords("攻击：10888亿、防御10888亿、血量10888亿、所有武功提升 120000层") + "<br>" + LanResManager.getLanCommonTextWords("金之书（特殊技能）：攻击时有几率使对手双眼被金光闪耀，无法锁定对手5秒。") + "</font>";
                  }
                  if(GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHIREN_MUZHISHU_MIJI_ID] == 1 && staArr[_loc4_].id == 3)
                  {
                     _loc5_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'><br>" + LanResManager.getLanCommonTextWords("木之书秘籍：") + "<br>" + LanResManager.getLanCommonTextWords("攻击：10888亿、防御10888亿、血量10888亿、所有武功提升 120000层") + "<br>" + LanResManager.getLanCommonTextWords("木之书（特殊技能）：攻击时有几率使对手瞬间掉血60%血量。") + "</font>";
                  }
                  if(GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHIREN_SHUIZHISHU_MIJI_ID] == 1 && staArr[_loc4_].id == 5)
                  {
                     _loc5_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'><br>" + LanResManager.getLanCommonTextWords("水之书秘籍：") + "<br>" + LanResManager.getLanCommonTextWords("攻击：10888亿、防御10888亿、血量10888亿、所有武功提升 120000层") + "<br>" + LanResManager.getLanCommonTextWords("水之书（特殊技能）：攻击时有几率使对手武功全失。") + "</font>";
                  }
                  if(GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHIREN_HUOZHISHU_MIJI_ID] == 1 && staArr[_loc4_].id == 1)
                  {
                     _loc5_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'><br>" + LanResManager.getLanCommonTextWords("火之书秘籍：") + "<br>" + LanResManager.getLanCommonTextWords("攻击：10888亿、防御10888亿、血量10888亿、所有武功提升 120000层") + "<br>" + LanResManager.getLanCommonTextWords("火之书（特殊技能）：被攻击时有几率触发火焰效果，使对手所有勋章失效。") + "</font>";
                  }
                  if(GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHIREN_TUZHISHU_MIJI_ID] == 1 && staArr[_loc4_].id == 4)
                  {
                     _loc5_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'><br>" + LanResManager.getLanCommonTextWords("土之书秘籍：") + "<br>" + LanResManager.getLanCommonTextWords("攻击：10888亿、防御10888亿、血量10888亿、所有武功提升 120000层") + "<br>" + LanResManager.getLanCommonTextWords("土之书（特殊技能）：被攻击时有几率触发土之盾效果，100%免疫所有负面状态。") + "</font>";
                  }
               }
               else
               {
                  if(GameState.dictMainStatus[SpecialGoodsID.WUXINGZHIREN_JINZHISHU_MIJI_ID] == 1 && staArr[_loc4_].id == 2)
                  {
                     _loc5_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'><br>" + LanResManager.getLanCommonTextWords("金之书秘籍：") + "<br>" + LanResManager.getLanCommonTextWords("攻击：10888亿、防御10888亿、血量10888亿、所有武功提升 120000层") + "<br>" + LanResManager.getLanCommonTextWords("金之书（特殊技能）：攻击时有几率使对手双眼被金光闪耀，无法锁定对手5秒。") + "</font>";
                  }
                  if(GameState.dictMainStatus[SpecialGoodsID.WUXINGZHIREN_MUZHISHU_MIJI_ID] == 1 && staArr[_loc4_].id == 3)
                  {
                     _loc5_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'><br>" + LanResManager.getLanCommonTextWords("木之书秘籍：") + "<br>" + LanResManager.getLanCommonTextWords("攻击：10888亿、防御10888亿、血量10888亿、所有武功提升 120000层") + "<br>" + LanResManager.getLanCommonTextWords("木之书（特殊技能）：攻击时有几率使对手瞬间掉血60%血量。") + "</font>";
                  }
                  if(GameState.dictMainStatus[SpecialGoodsID.WUXINGZHIREN_SHUIZHISHU_MIJI_ID] == 1 && staArr[_loc4_].id == 5)
                  {
                     _loc5_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'><br>" + LanResManager.getLanCommonTextWords("水之书秘籍：") + "<br>" + LanResManager.getLanCommonTextWords("攻击：10888亿、防御10888亿、血量10888亿、所有武功提升 120000层") + "<br>" + LanResManager.getLanCommonTextWords("水之书（特殊技能）：攻击时有几率使对手武功全失。") + "</font>";
                  }
                  if(GameState.dictMainStatus[SpecialGoodsID.WUXINGZHIREN_HUOZHISHU_MIJI_ID] == 1 && staArr[_loc4_].id == 1)
                  {
                     _loc5_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'><br>" + LanResManager.getLanCommonTextWords("火之书秘籍：") + "<br>" + LanResManager.getLanCommonTextWords("攻击：10888亿、防御10888亿、血量10888亿、所有武功提升 120000层") + "<br>" + LanResManager.getLanCommonTextWords("火之书（特殊技能）：被攻击时有几率触发火焰效果，使对手所有勋章失效。") + "</font>";
                  }
                  if(GameState.dictMainStatus[SpecialGoodsID.WUXINGZHIREN_TUZHISHU_MIJI_ID] == 1 && staArr[_loc4_].id == 4)
                  {
                     _loc5_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'><br>" + LanResManager.getLanCommonTextWords("土之书秘籍：") + "<br>" + LanResManager.getLanCommonTextWords("攻击：10888亿、防御10888亿、血量10888亿、所有武功提升 120000层") + "<br>" + LanResManager.getLanCommonTextWords("土之书（特殊技能）：被攻击时有几率触发土之盾效果，100%免疫所有负面状态。") + "</font>";
                  }
               }
               return _loc5_ + "</textformat>";
            });
            this.container.addChild(this.tmpSpr);
            if(i == 0)
            {
               this.tmpSpr.x = 165 + 2;
               this.tmpSpr.y = 75;
            }
            else if(i == 1)
            {
               this.tmpSpr.x = 260 + 5 + 5;
               this.tmpSpr.y = 160;
            }
            else if(i == 2)
            {
               this.tmpSpr.x = 220 + 10;
               this.tmpSpr.y = 260 + 5;
            }
            else if(i == 3)
            {
               this.tmpSpr.x = 90 + 5 + 10;
               this.tmpSpr.y = 260 + 5;
            }
            else if(i == 4)
            {
               this.tmpSpr.x = 50 + 15;
               this.tmpSpr.y = 160;
            }
            if(i == this.xuanzhong - 1)
            {
               this.selectSpr.x = -5 + 1;
               this.selectSpr.y = -5 + 1;
               this.tmpSpr.addChildAt(this.selectSpr,1);
               this.sprArray.push(this.tmpSpr);
               if(this.linkMc != null)
               {
                  this.linkMc.visible = true;
                  this.linkMc.gotoAndStop(this.xuanzhong);
               }
               loadUrl = GameConfig.fileBaseFolder + "res/data/mc/wuxingzhiren/" + (i + 1) + ".swf";
               if(Boolean(this.wuqiMc) && this.wuqiMc.parent != null)
               {
                  this.wuqiMc.stop();
                  this.wuqiMc.parent.removeChild(this.wuqiMc);
               }
               if(this.mcObj[i] != null)
               {
                  this.wuqiMc = this.mcObj[i];
                  this.wuqiMc.play();
                  this.wuqiMc.x = -70 + 10;
                  this.wuqiMc.y = -50 - 10 + 5 + 10;
                  this.container.addChildAt(this.wuqiMc,0);
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
                     wuqiMc = _loc2_.content as MovieClip;
                     mcObj[xuanzhong - 1] = wuqiMc;
                     if(wuqiMc)
                     {
                        wuqiMc.x = -70 + 10;
                        wuqiMc.y = -50 - 10 + 5 + 10;
                        container.addChildAt(wuqiMc,0);
                     }
                  },null,false,loadUrl);
               }
            }
            i++;
         }
      }
      
      private function onLoadCallBack(param1:Event) : void
      {
         var _loc4_:Array = null;
         var _loc2_:LoadingItem = param1.target as LoadingItem;
         var _loc3_:MovieClip = _loc2_.content as MovieClip;
         if(_loc3_)
         {
            _loc4_ = _loc2_.url.url.split("/");
            if(_loc4_[_loc4_.length - 1] == "arrow1.swf")
            {
               _loc3_.x = 185 - 20;
               _loc3_.y = 155 - 50;
               this.mcArrowObj[0] = _loc3_;
            }
            else if(_loc4_[_loc4_.length - 1] == "arrow2.swf")
            {
               _loc3_.x = 180 + 10;
               _loc3_.y = 195 - 40;
               this.mcArrowObj[1] = _loc3_;
            }
            else if(_loc4_[_loc4_.length - 1] == "arrow3.swf")
            {
               _loc3_.x = 95 + 90;
               _loc3_.y = 155 + 40;
               this.mcArrowObj[2] = _loc3_;
            }
            else if(_loc4_[_loc4_.length - 1] == "arrow4.swf")
            {
               _loc3_.x = 165 - 50;
               _loc3_.y = 110 + 85;
               this.mcArrowObj[3] = _loc3_;
            }
            else if(_loc4_[_loc4_.length - 1] == "arrow5.swf")
            {
               _loc3_.x = 120 - 30;
               _loc3_.y = 185 - 30;
               this.mcArrowObj[4] = _loc3_;
            }
            _loc3_.play();
            _loc3_.visible = true;
            this.container.addChild(_loc3_);
         }
      }
      
      private function onJiHuoClick(param1:MouseEvent) : void
      {
         var _loc2_:String = param1.currentTarget.name;
         var _loc3_:int = Number(_loc2_);
         this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_WUXING_JIHUO_CLICK,"",_loc3_ + 1));
      }
      
      private function onShowClick(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_WUXING_SHOW_CLICK,"",this.check.selectState));
      }
      
      private function onBtnClick(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         if(!this.isOthers)
         {
            _loc2_ = param1.currentTarget.name;
            _loc3_ = Number(_loc2_);
            this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_WUXING_QIEHUAN_CLICK,"",_loc3_ + 1));
         }
      }
      
      public function setYunInitializeWuXingZhiRen(param1:Boolean, param2:Array, param3:String, param4:int, param5:int, param6:Boolean) : void
      {
         this.isUse = param6;
         this.staArr = null;
         this.staArr = new Array();
         this.staArr = param2;
         this.miaoshu.htmlText = param3;
         this.xuanzhong = param4;
         this.setGoods(param5);
         this.setWuXingSta();
         this.setJiHuo(param1);
      }
      
      public function wuxingzhirenHZ(param1:Boolean) : void
      {
         this.checkHz.selectState = param1;
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         this.isMain00 = param1;
         if(param1)
         {
            this.kuangSpr.visible = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHIREN_YN_WUXINGDENG_ID];
            this.equipContainers.visible = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHIREN_YN_WUXINGDENG_ID];
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHIREN_ZUIZHONG_ID];
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHIREN_SHENBINGJIHUO_ID];
            this.jinzhishi = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHIREN_JINZHISHI_ID];
            this.muzhishi = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHIREN_MUZHISHI_ID];
            this.shuizhishi = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHIREN_SHUIZHISHI_ID];
            this.huozhishi = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHIREN_HUOZHISHI_ID];
            this.tuzhishi = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHIREN_TUZHISHI_ID];
            this.jinzhishu = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHIREN_JINZHISHU_ID];
            this.jinzhiyuan = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHIREN_JINZHIYUAN_ID];
            this.muzhishu = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHIREN_MU_ID];
            this.muzhiyuan = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHIREN_MUZHIYUAN_ID];
            this.shuizhishu = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHIREN_SHUI_ID];
            this.shuizhiyuan = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHIREN_SHUIZHIYUAN_ID];
            this.huozhishu = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHIREN_HUO_ID];
            this.huozhiyuan = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHIREN_HUOZHIYUAN_ID];
            this.tuzhishu = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHIREN_TU_ID];
            this.tuzhiyuan = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHIREN_TUZHIYUAN_ID];
            this.kuangSpr2.visible = GameState.dictMainStatus[SpecialGoodsID.YN_WUXINGZHIREN_ID];
            if(Boolean(this.jinzhishu) && Boolean(this.muzhishu) && Boolean(this.shuizhishu) && Boolean(this.huozhishu) && Boolean(this.tuzhishu))
            {
               this.fts3.visible = true;
            }
            else
            {
               this.fts3.visible = false;
            }
            this.donghuangzhong = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHIREN_DONGHUANGZHONG_ID];
            this.sherigong = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHIREN_SHERIGONG_ID];
            this.lianyaohu = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHIREN_LIANYAOHU_ID];
            this.haotianchui = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHIREN_HAOTIANCHUI_ID];
            this.linglongta = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHIREN_LINGLONGTA_ID];
            if(this.donghuangzhong || this.sherigong || this.lianyaohu || this.haotianchui || this.linglongta)
            {
               this.fts4.visible = true;
            }
            else
            {
               this.fts4.visible = false;
            }
            this.fts5.visible = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHIREN_KAIFENGFU_ID];
            this.xuanyuanshi = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHIREN_XUANYUANSHI_ID];
            this.fts6.visible = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHIREN_XUANYUANNVWASHI_ID];
            this.nvwashi = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHIREN_NVWASHISUIPIAN_ID];
            this.fts7.visible = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHIREN_LUOSHENJIAN_ID];
            this.fts8.visible = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHIREN_SHENJIANZHONG_ID];
            this.isLearn1 = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHIREN_SHENJIANZHONG_ID];
            this.fts9.visible = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHIREN_JIANJI_ID];
            this.isLearn2 = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHIREN_JIANJI_ID];
            this.setSkillJiHuo(200328,200333);
            this.fts10.visible = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHIREN_WUYINGQIANHUAN_ID];
            this.fts11.visible = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHIREN_CHIYOU_ID];
            this.checkHz.visible = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHIREN_CHIYOU_ID];
            this.fts12.visible = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHIREN_WUXINGFENGYIN_ID];
            this.wuxingyinji = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHIREN_WUXINGYINJI_ID];
         }
         else
         {
            this.kuangSpr.visible = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHIREN_YN_WUXINGDENG_ID];
            this.equipContainers.visible = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHIREN_YN_WUXINGDENG_ID];
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHIREN_ZUIZHONG_ID];
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHIREN_SHENBINGJIHUO_ID];
            this.jinzhishi = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHIREN_JINZHISHI_ID];
            this.muzhishi = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHIREN_MUZHISHI_ID];
            this.shuizhishi = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHIREN_SHUIZHISHI_ID];
            this.huozhishi = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHIREN_HUOZHISHI_ID];
            this.tuzhishi = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHIREN_TUZHISHI_ID];
            this.jinzhishu = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHIREN_JINZHISHU_ID];
            this.jinzhiyuan = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHIREN_JINZHIYUAN_ID];
            this.muzhishu = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHIREN_MU_ID];
            this.muzhiyuan = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHIREN_MUZHIYUAN_ID];
            this.shuizhishu = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHIREN_SHUI_ID];
            this.shuizhiyuan = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHIREN_SHUIZHIYUAN_ID];
            this.huozhishu = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHIREN_HUO_ID];
            this.huozhiyuan = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHIREN_HUOZHIYUAN_ID];
            this.tuzhishu = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHIREN_TU_ID];
            this.tuzhiyuan = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHIREN_TUZHIYUAN_ID];
            this.kuangSpr2.visible = GameState.dictTargetStatus[SpecialGoodsID.YN_WUXINGZHIREN_ID];
            if(Boolean(this.jinzhishu) && Boolean(this.muzhishu) && Boolean(this.shuizhishu) && Boolean(this.huozhishu) && Boolean(this.tuzhishu))
            {
               this.fts3.visible = true;
            }
            else
            {
               this.fts3.visible = false;
            }
            this.donghuangzhong = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHIREN_DONGHUANGZHONG_ID];
            this.sherigong = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHIREN_SHERIGONG_ID];
            this.lianyaohu = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHIREN_LIANYAOHU_ID];
            this.haotianchui = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHIREN_HAOTIANCHUI_ID];
            this.linglongta = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHIREN_LINGLONGTA_ID];
            if(this.donghuangzhong || this.sherigong || this.lianyaohu || this.haotianchui || this.linglongta)
            {
               this.fts4.visible = true;
            }
            else
            {
               this.fts4.visible = false;
            }
            this.fts5.visible = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHIREN_KAIFENGFU_ID];
            this.xuanyuanshi = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHIREN_XUANYUANSHI_ID];
            this.fts6.visible = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHIREN_XUANYUANNVWASHI_ID];
            this.nvwashi = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHIREN_NVWASHISUIPIAN_ID];
            this.fts7.visible = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHIREN_LUOSHENJIAN_ID];
            this.fts8.visible = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHIREN_SHENJIANZHONG_ID];
            this.isLearn1 = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHIREN_SHENJIANZHONG_ID];
            this.fts9.visible = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHIREN_JIANJI_ID];
            this.isLearn2 = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHIREN_JIANJI_ID];
            this.setSkillJiHuo(200328,200333);
            this.fts10.visible = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHIREN_WUYINGQIANHUAN_ID];
            this.fts11.visible = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHIREN_CHIYOU_ID];
            this.checkHz.visible = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHIREN_CHIYOU_ID];
            this.fts12.visible = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHIREN_WUXINGFENGYIN_ID];
            this.wuxingyinji = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHIREN_WUXINGYINJI_ID];
         }
      }
      
      public function setTimerText(param1:Number) : void
      {
         if(param1 > 0)
         {
            this.timerText.visible = true;
            this.timerText.htmlText = LanResManager.getLanCommonTextWords("五行切换冷却时间") + ":" + (Math.floor(param1 / 60) + LanResManager.getLanCommonTextWords("分") + Math.floor(param1 % 60) + LanResManager.getLanCommonTextWords("秒"));
         }
         else
         {
            this.timerText.visible = false;
         }
      }
      
      public function setMiaoShuText(param1:String) : void
      {
         this.miaoshu.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + param1;
      }
      
      public function setWuXingZhiRenEnabledFun() : void
      {
         this.timerText.visible = false;
         this.isOthers = true;
         this.check.enabled = false;
      }
      
      public function showWuXingZhiRenApd(param1:Boolean) : void
      {
         this.check.selectState = param1;
      }
      
      public function showKaiQiTiShi(param1:int) : void
      {
         var tempStr1:String = null;
         var tempStr2:String = null;
         var index:int = param1;
         var str1:String = new String();
         str1 = "<font color=\'" + StaticValue.RED_HTML + "\'>";
         var str2:String = new String();
         str2 = "<font color=\'" + StaticValue.GREEN_HTML + "\'>";
         tempStr1 = LanResManager.getLanCommonTextWords("您是否要将五行属性切换为【$1】属性") + "?";
         tempStr2 = LanResManager.getLanCommonTextWords("开启【$1】属性后，对【$2】属性和无五行属性的角色");
         tempStr1 = tempStr1.replace("$1",this.staArr[index - 1].name);
         tempStr2 = tempStr2.replace("$1",this.staArr[index - 1].name);
         tempStr2 = tempStr2.replace("$2",this.staArr[index - 1].xkshuxing);
         str1 += tempStr1;
         str2 += tempStr2;
         if(this.qiehuan == null)
         {
            this.qiehuan = new WuXingZhiRenQieHuanPanel();
            this.qiehuan.addEventListener(WuXingZhiRenQieHuanPanel.UI_WUXINGZHIREN_QIEHUAN,function(param1:BaseEvent):void
            {
               $parent.dispatchEvent(new BaseEvent(CharAttribute.UI_WUXING_USE_CLICK,"",param1.data as int));
            });
         }
         this.qiehuan.setText(str1,str2,index);
         this.qiehuan.x = (GameConfig.sceneWidth - this.qiehuan.width) / 2;
         this.qiehuan.y = (GameConfig.sceneHeight - this.qiehuan.height) / 2;
         GameInstance.uiInstance.uiContainer.addChild(this.qiehuan);
      }
      
      public function removeMc() : void
      {
         var _loc1_:* = undefined;
         for each(_loc1_ in this.mcObj)
         {
            if(Boolean(_loc1_) && _loc1_.parent != null)
            {
               _loc1_.stop();
               _loc1_.parent.removeChild(_loc1_);
            }
         }
         for each(_loc1_ in this.mcArrowObj)
         {
            if(Boolean(_loc1_) && _loc1_.parent != null)
            {
               _loc1_.stop();
               _loc1_.parent.removeChild(_loc1_);
            }
         }
      }
      
      public function setGoods(param1:int) : void
      {
         var goodId:int = param1;
         with(this.goodsContainer.graphics)
         {
            beginFill(0,0.5);
            drawRect(0,0,36,36);
            endFill();
         }
         this.img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.goodsContainer.addChild(this.img);
         if(this.item != null && this.item.parent != null)
         {
            this.item.parent.removeChild(this.item);
         }
         this.goodIdUsed = goodId;
         if(goodId != 0)
         {
            this.item = new ItemFace(new Goods(goodId));
            this.item.x = 2;
            this.item.y = 2;
            this.goodsContainer.addChild(this.item);
            this.item.mouseChildren = false;
            this.item.mouseEnabled = false;
         }
      }
      
      private function onItemClick00(param1:MouseEvent) : void
      {
         if(this.isMain00)
         {
            this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      private function onItemClick000(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
      }
      
      public function set_WuXingZhiRen(param1:Array) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         while(this.equipContainers.numChildren > 0)
         {
            this.equipContainers.removeChildAt(0);
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_] as Goods;
            _loc4_ = new ItemFace(_loc3_);
            if(_loc3_.res.position == ItemPositionRange.POSTION_WUXINGZHIREN_JUEXUE1)
            {
               _loc4_.x = 4 + 1 + 120 + 117 - 2 + 1;
               _loc4_.y = 4 + 1 - 185 - 21 + 1;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_WUXINGZHIREN_JUEXUE2)
            {
               _loc4_.x = 40 + 4 + 1 + 120 + 6 + 99 - 3;
               _loc4_.y = 4 + 1 - 185 + 25 + 83 - 1;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_WUXINGZHIREN_JUEXUE3)
            {
               _loc4_.x = 40 + 4 + 1 + 40 + 120 + 12 - 145 + 1;
               _loc4_.y = 4 + 1 - 185 + 107;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_WUXINGZHIREN_JUEXUE4)
            {
               _loc4_.x = 4 + 1 + 120 - 17 + 2;
               _loc4_.y = 4 + 1 - 185 + 75 - 95;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_WUXINGZHIREN_JUEXUE5)
            {
               _loc4_.x = 40 + 4 + 1 + 40 + 120 + 12 - 47 + 1;
               _loc4_.y = 4 + 1 - 185 + 75 + 82 - 2;
               this.equipContainers.addChild(_loc4_);
            }
            _loc2_++;
         }
      }
      
      public function setZhuangbei2(param1:Array) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         while(this.equipContainers2.numChildren > 0)
         {
            this.equipContainers2.removeChildAt(0);
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_] as Goods;
            _loc4_ = new ItemFace(_loc3_);
            if(_loc3_.res.position == ItemPositionRange.POSTION_DAGOUBANG_WUXINGZHIREN)
            {
               _loc4_.x = 127;
               _loc4_.y = 153;
               this.equipContainers2.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_TANZHISHENTONG_WUXINGZHIREN)
            {
               _loc4_.x = 225;
               _loc4_.y = 153;
               this.equipContainers2.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_CHUNYANGXUANGONG_WUXINGZHIREN)
            {
               _loc4_.x = 177;
               _loc4_.y = 177;
               this.equipContainers2.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_HAMAGONG_WUXINGZHIREN)
            {
               _loc4_.x = 126;
               _loc4_.y = 226;
               this.equipContainers2.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_YIYANGZHI_WUXINGZHIREN)
            {
               _loc4_.x = 177;
               _loc4_.y = 242;
               this.equipContainers2.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_KONGMINGQUAN_WUXINGZHIREN)
            {
               _loc4_.x = 225;
               _loc4_.y = 226;
               this.equipContainers2.addChild(_loc4_);
            }
            _loc2_++;
         }
      }
      
      private function onSkillMouseDown(param1:MouseEvent) : void
      {
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
         this.p = new Point(mouseX,mouseY);
         this.currSkill = param1.target as ItemFace;
      }
      
      private function onSkillMouseMove(param1:MouseEvent) : void
      {
         if(this.currSkill != param1.target)
         {
            this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            if((this.currSkill.getBaseItem() as Skill).res.useway == 1 && (this.currSkill.getBaseItem() as Skill).isLearn == 1)
            {
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DINGCHANJUE_SKILL_DRAG,"",this.currSkill));
            }
            this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
         }
      }
      
      private function onSkillMouseUp(param1:MouseEvent) : void
      {
         this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
      }
      
      public function setSkillJiHuo(param1:int, param2:int) : void
      {
         while(this.mainSkillContainer.numChildren > 0)
         {
            this.mainSkillContainer.removeChildAt(0);
         }
         if(this.mainSkillItemFace)
         {
            if(this.mainSkillItemFace.parent)
            {
               this.mainSkillItemFace.parent.removeChild(this.mainSkillItemFace);
            }
         }
         if(this.mainSkillItemFace2)
         {
            if(this.mainSkillItemFace2.parent)
            {
               this.mainSkillItemFace2.parent.removeChild(this.mainSkillItemFace2);
            }
         }
         var _loc3_:Skill = new Skill(param1);
         this.mainSkill = _loc3_;
         this.mainSkill.isLearn = 1;
         this.mainSkillItemFace = new ItemFace(this.mainSkill);
         this.mainSkillItemFace.showKungFuTag();
         this.mainSkillItemFace.setShowCount(false);
         this.mainSkillContainer.addChild(this.mainSkillItemFace);
         var _loc4_:Skill = new Skill(param2);
         _loc4_.isLearn = 1;
         this.mainSkillItemFace2 = new ItemFace(_loc4_);
         this.mainSkillItemFace2.showKungFuTag();
         this.mainSkillItemFace2.setShowCount(false);
         this.mainSkillItemFace2.y = -63;
         this.mainSkillContainer.addChild(this.mainSkillItemFace2);
         if(this.isLearn1)
         {
            this.mainSkillItemFace.visible = true;
            this.kuang1.visible = true;
         }
         else
         {
            this.mainSkillItemFace.visible = false;
            this.kuang1.visible = false;
         }
         if(this.isLearn2)
         {
            this.mainSkillItemFace2.visible = true;
            this.kuang2.visible = true;
         }
         else
         {
            this.mainSkillItemFace2.visible = false;
            this.kuang2.visible = false;
         }
      }
   }
}

