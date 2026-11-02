package com.tgame.shell.view.components.ride
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.character.PureMount;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.PipeManager;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.*;
   
   public class DianFengShouPanel extends FPanel
   {
      
      public static const UI_DIANFENGSHOUPANEL_CHAKAN_CLICK:String = "UI_DIANFENGSHOUPANEL_CHAKAN_CLICK";
      
      public static const UI_DIANFENGSHOUPANEL_JIHUO_CLICK:String = "UI_DIANFENGSHOUPANEL_JIHUO_CLICK";
      
      public static const UI_DIANFENGSHOUPANEL_SHOW_CLICK:String = "UI_DIANFENGSHOUPANEL_SHOW_CLICK";
      
      public static const UI_DIANFENGSHOUPANEL_QICHENG_CLICK:String = "UI_DIANFENGSHOUPANEL_QICHENG_CLICK";
      
      public static const UI_DIANFENGSHOUPANEL_DRAG_UP:String = "UI_DIANFENGSHOUPANEL_DRAG_UP";
      
      public static const UI_DIANFENGSHOUPANEL_DRAG_DOWN:String = "UI_DIANFENGSHOUPANEL_DRAG_DOWN";
      
      public static const UI_DIANFENGSHOUPANEL_WEISHI_CLICK:String = "UI_DIANFENGSHOUPANEL_WEISHI_CLICK";
      
      public static const UI_DINGCHANJUE_SKILL_DRAG:String = "UI_DINGCHANJUE_SKILL_DRAG";
      
      public static const UI_YNJIHUOXUNZHANG:String = "UI_YNJIHUOXUNZHANG";
      
      public static const SHOW_COUNT_BTN:int = 5;
      
      public var $parent:DisplayObject;
      
      private var _avatar:Bitmap;
      
      private var _mask:Shape;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var preBtn:NewSkinButton;
      
      private var nextBtn:NewSkinButton;
      
      private var jiHuoBtn:NewSkinButton;
      
      private var qiChengBtn:NewSkinButton;
      
      private var shouHuiBtn:NewSkinButton;
      
      private var text:FTextArea;
      
      private var nameFta:FTextArea;
      
      private var lvFta:FTextArea;
      
      private var hateBar:MovieClip;
      
      private var ft_Name1:FTextArea;
      
      private var ft_Value1:FTextArea;
      
      private var ft_Name2:FTextArea;
      
      private var ft_Value2:FTextArea;
      
      private var ft_Name3:FTextArea;
      
      private var ft_Value3:FTextArea;
      
      private var skillText:FTextArea;
      
      private var check:FCheckBox;
      
      private var lb:FLabel;
      
      private var pMount:PureMount;
      
      private var shuoMing:SecondButton;
      
      private var shuoMingPanel:DianFengShouShuoMingPanel;
      
      private var jiHuoPanel:DianFengShouJiHuoPanel;
      
      private var needGongXun:int;
      
      private var nowGongXun:int;
      
      private var jinDuLable:FLabel;
      
      private var barSpr:Sprite;
      
      private var isMainChar:Boolean = true;
      
      public var nowIndex:int;
      
      public var idArray:Array;
      
      public var headBtnSpr:Sprite;
      
      public var bgDict:Array;
      
      public var bgSpr:Sprite;
      
      public var headBtnDict:Array;
      
      public var lvImgDict:Array;
      
      public var lvImgSpr:Sprite;
      
      public var skillSpr:Sprite;
      
      public var selectMc:MovieClip;
      
      public var selectSpr:Sprite;
      
      private var fts1:FTextArea;
      
      private var foodContainer:Sprite;
      
      private var kuang:Bitmap;
      
      private var p:Point;
      
      private var currItem:ItemFace;
      
      private var food:*;
      
      private var weiBtn:SmallButton;
      
      private var fts2:FTextArea;
      
      private var zuoqiByte:int = 0;
      
      private var fts3:FTextArea;
      
      private var fts4:FTextArea;
      
      private var mainSkillContainer:Sprite;
      
      private var mainSkillItemFace:ItemFace;
      
      private var kuang1:Bitmap;
      
      private var currSkill:ItemFace;
      
      private var fts5:FTextArea;
      
      private var suipian:int = 0;
      
      private var ynEquipSpr:Sprite;
      
      private var ynJihuoBtn:SecondButton;
      
      public var _$parent:DisplayObject;
      
      private var yanhuaMc:MovieClip;
      
      private var fts1_1:FTextArea;
      
      private var fts2_1:FTextArea;
      
      private var fts3_1:FTextArea;
      
      private var fts5_1:FTextArea;
      
      private var fts6_1:FTextArea;
      
      public function DianFengShouPanel()
      {
         var bg:DisplayObject;
         var img:Bitmap;
         this.bgDict = [];
         this.headBtnDict = [];
         this.lvImgDict = [];
         super();
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         width = 480 - 5;
         height = 540 + 62;
         titleText = LanResManager.getLanCommonTextWords("巅峰兽");
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/supermount/dianfengbg.swf");
         bg.x = 8;
         bg.y = 0;
         addChild(bg);
         this.bgSpr = new Sprite();
         addChild(this.bgSpr);
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 2;
            y = 2;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.tipCanvas.addChild(this.tip);
         this.lvImgSpr = new Sprite();
         this.lvImgSpr.x = 400;
         this.lvImgSpr.y = 120;
         addChild(this.lvImgSpr);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 20;
            y = 385;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("仇恨值");
         }
         addChild(this.lb);
         this.barSpr = new Sprite();
         addChild(this.barSpr);
         this.jinDuLable = new FLabel();
         with(this.jinDuLable)
         {
            x = 240;
            y = 385;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = "0/0";
         }
         addChild(this.jinDuLable);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 30;
            y = 410;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("基础属性");
         }
         this.ft_Name1 = new FTextArea();
         this.ft_Name1.x = 40;
         this.ft_Name1.y = 430;
         this.ft_Name1.htmlText = "<textformat leading=\'4\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击") + "<br>" + LanResManager.getLanCommonTextWords("闪避") + "</font></textformat>";
         this.ft_Name2 = new FTextArea();
         this.ft_Name2.x = this.ft_Name1.x + 150;
         this.ft_Name2.y = this.ft_Name1.y;
         this.ft_Name2.htmlText = "<textformat leading=\'4\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("防御") + "<br>" + LanResManager.getLanCommonTextWords("生命") + "</font></textformat>";
         this.ft_Name3 = new FTextArea();
         this.ft_Name3.x = this.ft_Name1.x + 300;
         this.ft_Name3.y = this.ft_Name1.y;
         this.ft_Name3.htmlText = "<textformat leading=\'4\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("暴击") + "</font></textformat>";
         this.ft_Value1 = new FTextArea();
         this.ft_Value1.x = this.ft_Name1.x + 30;
         this.ft_Value1.y = this.ft_Name1.y;
         this.ft_Value2 = new FTextArea();
         this.ft_Value2.x = this.ft_Name2.x + 30;
         this.ft_Value2.y = this.ft_Name1.y;
         this.ft_Value3 = new FTextArea();
         this.ft_Value3.x = this.ft_Name3.x + 30;
         this.ft_Value3.y = this.ft_Name1.y;
         img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         img.x = 40;
         img.y = 480 - 45;
         addChild(img);
         this.skillSpr = new Sprite();
         this.skillSpr.x = img.x + 2;
         this.skillSpr.y = img.y + 2;
         addChild(this.skillSpr);
         this.skillText = new FTextArea();
         this.skillText.wordWrap = true;
         this.skillText.x = 30;
         this.skillText.y = 463 - 45;
         this.skillText.width = 400;
         this.skillText.height = 20;
         this.skillText.htmlText = "<textformat leading=\'4\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("特殊技能") + "</font></textformat>";
         addChild(this.skillText);
         this.skillText = new FTextArea();
         this.skillText.wordWrap = true;
         this.skillText.x = 90;
         this.skillText.y = 485 - 45;
         this.skillText.width = 360;
         this.skillText.height = 70;
         addChild(this.skillText);
         this.check = new FCheckBox();
         this.check.x = 20;
         this.check.y = 530;
         this.check.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 40;
            y = 531;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("默认骑乘巅峰兽");
         }
         this.selectSpr = new Sprite();
         addChild(this.selectSpr);
         this.headBtnSpr = new Sprite();
         addChild(this.headBtnSpr);
         this.preBtn = new NewSkinButton();
         this.preBtn.skin = "left_dianFengShou_Button";
         addChild(this.preBtn);
         this.preBtn.x = 15;
         this.preBtn.y = 25;
         this.preBtn.visible = false;
         this.preBtn.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         this.nextBtn = new NewSkinButton();
         this.nextBtn.skin = "right_dianFengShou_Button";
         addChild(this.nextBtn);
         this.nextBtn.x = 425;
         this.nextBtn.y = 25;
         this.nextBtn.visible = false;
         this.nextBtn.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         this.jiHuoBtn = new NewSkinButton();
         this.jiHuoBtn.skin = "jiHuoDianFengShou_btn";
         addChild(this.jiHuoBtn);
         this.jiHuoBtn.x = 170;
         this.jiHuoBtn.y = 525;
         this.jiHuoBtn.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         this.qiChengBtn = new NewSkinButton();
         this.qiChengBtn.skin = "qiChengDianFengShou_btn";
         this.qiChengBtn.visible = false;
         addChild(this.qiChengBtn);
         this.qiChengBtn.x = 170;
         this.qiChengBtn.y = 525;
         this.qiChengBtn.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         this.shouHuiBtn = new NewSkinButton();
         this.shouHuiBtn.skin = "shouHuiDianFengShou_btn";
         this.shouHuiBtn.visible = false;
         addChild(this.shouHuiBtn);
         this.shouHuiBtn.x = 170;
         this.shouHuiBtn.y = 525;
         this.shouHuiBtn.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         this.shuoMing = new SecondButton();
         this.shuoMing.label = LanResManager.getLanCommonTextWords("巅峰兽说明");
         addChild(this.shuoMing);
         this.shuoMing.x = 370;
         this.shuoMing.y = 530;
         this.shuoMing.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         this.fts1 = new FTextArea();
         this.fts1.x = 10 + 7;
         this.fts1.y = 7 + 20 + 20 + 137;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 200;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("巅峰石（异兽）");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特珠属性：攻击88888亿 防御62888亿 血量90888亿 暴击 88888") + "<br>" + LanResManager.getLanCommonTextWords("闪避88888 所有武功1400000层潜力幻影： 当玩家骑兽巅峰的时候，") + "<br>" + LanResManager.getLanCommonTextWords("攻击18次时100%触发巅峰兽潜力幻影，巅峰兽一分为二，场景内同时") + "<br>" + LanResManager.getLanCommonTextWords("出现两只巅峰兽，使对手失去原本锁定的目标，且自身在幻影状态下，") + "<br>" + LanResManager.getLanCommonTextWords("对手不管做任对手失去原本锁定的目标，且自身在幻影状态下，对手") + "<br>" + LanResManager.getLanCommonTextWords("不管做任对手失去原本锁定的目标，且自身在幻影状态下，对手不管") + "<br>" + LanResManager.getLanCommonTextWords("做任何锁定都只可锁定影子巅峰兽") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 10 + 7 + 56;
         this.fts2.y = 7 + 20 + 20 + 137 + 170;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 200;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("巅峰秘籍（已激活）");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("喂：玩家可放入巅峰宝石（红）、巅峰宝石（黄）、巅峰宝石（绿）内进行喂养，") + "<br>" + LanResManager.getLanCommonTextWords("总共可养成100次，每养成不同的宝石可增加不同的技能，哪种宝石养成的越多触") + "<br>" + LanResManager.getLanCommonTextWords("发的几率越高。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.weiBtn = new SmallButton();
         this.weiBtn.label = LanResManager.getLanCommonTextWords("喂");
         addChild(this.weiBtn);
         this.weiBtn.x = 74;
         this.weiBtn.y = 340 - 10;
         this.weiBtn.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.kuang.x = 27 - 2;
         this.kuang.y = 28 + 306 - 2;
         addChild(this.kuang);
         this.foodContainer = new Sprite();
         addChild(this.foodContainer);
         this.foodContainer.x = 27;
         this.foodContainer.y = 28 + 306;
         with(this.foodContainer.graphics)
         {
            beginFill(0,0.5);
            drawRect(0,0,35,35);
            endFill();
         }
         this.foodContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         this.foodContainer.addEventListener(MouseEvent.MOUSE_UP,this.onfoodClick,false,30);
         this.fts3 = new FTextArea();
         this.fts3.x = 10 + 7;
         this.fts3.y = 7 + 20 + 20 + 137;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 200;
         this.fts3.height = 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("混沌隐藏激活石（异兽）");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击10888888889000 防御8888888889000 血量12888888889000") + "<br>" + LanResManager.getLanCommonTextWords("暴击88888闪避88888 所有武功2800000层") + "<br>" + LanResManager.getLanCommonTextWords("混沌吞噬：激活混沌隐藏属性的巅峰兽，混沌可瞬间吞噬傲剑最高坐骑的特殊属性（攻速、移动），") + "<br>" + LanResManager.getLanCommonTextWords("可提升巅峰兽混沌攻速+1600，移动速度290，人物骑乘可获得同样加成。") + "<br>" + LanResManager.getLanCommonTextWords("混沌开天：攻击时100%触发混沌开天，持续10秒；在此状态下，自身可反噬对手所有攻击和技能效") + "<br>" + LanResManager.getLanCommonTextWords("果；且每攻击一次，都将触发混沌开天的万物之力，对手每受到万物之力的影响将瞬间击退眩晕原") + "<br>" + LanResManager.getLanCommonTextWords("地无法移动，持续10秒。冷却60秒。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts4 = new FTextArea();
         this.fts4.x = 20 + 208 - 50 + 150;
         this.fts4.y = 20 + 159 + 175;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 170;
         this.fts4.height = 20;
         this.fts4.htmlText = LanResManager.getLanCommonTextWords("开天（神技）");
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("开天石化：盘古开天辟地，混沌初开，宇宙有了天和地，自此开天斧就留下一开天") + "<br>" + LanResManager.getLanCommonTextWords("神技落入人间，拥有开天主动技能的玩家，可锁定任意一个玩家，施发开天石化可") + "<br>" + LanResManager.getLanCommonTextWords("瞬间将对手石化成雕像树立在原地定身，持续10秒；且当状态解除后，对手受石化") + "<br>" + LanResManager.getLanCommonTextWords("影响，瞬间掉血60%，且全身所有勋章受石化腐蚀失效，持续10秒。冷却90秒。（") + "<br>" + LanResManager.getLanCommonTextWords("可在城里使用）") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.kuang1 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang1);
         this.kuang1.x = 25 + 324 - 58 + 120;
         this.kuang1.y = 160 + 35 - 186 + 156 + 175;
         this.mainSkillContainer = new Sprite();
         this.mainSkillContainer.x = 25 + 2 + 324 - 58 + 120;
         this.mainSkillContainer.y = 160 + 2 + 35 - 186 + 156 + 175;
         addChild(this.mainSkillContainer);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onSkillMouseDown);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_UP,this.onSkillMouseUp);
         this.fts5 = new FTextArea();
         this.fts5.x = 10 + 7;
         this.fts5.y = 7 + 20 + 20 + 137 + 20;
         this.fts5.textColor = StaticValue.GREEN;
         this.fts5.width = 200;
         this.fts5.height = 20;
         this.fts5.htmlText = LanResManager.getLanCommonTextWords("混沌天书(已激活)");
         this.fts5.visible = false;
         addChild(this.fts5);
         ToolTips.createToolTips(this.fts5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("混沌天书：攻击12888888889000 防御10888888889000 血量13888888889000") + LanResManager.getLanCommonTextWords("暴击 88888闪避88888   所有武功2500000层") + "<br>" + LanResManager.getLanCommonTextWords("混沌天书——拥有混沌天书的玩家，可永久开启盘古元神激活三大上古元神的能力，") + "<br>" + LanResManager.getLanCommonTextWords("激活后，可将开天元神、辟地元神、镇世元神的所有技能效果持续时间翻倍，可使对") + "<br>" + LanResManager.getLanCommonTextWords("手命中的状态时间提升至20秒。") + "<br>" + LanResManager.getLanCommonTextWords("混沌天书属性：激活混沌天书后，将开启混沌天书隐藏属性，可使用混沌碎片对该隐") + "<br>" + LanResManager.getLanCommonTextWords("藏属性进行养成，最多可养成200次。每个增加：攻击1500亿，所有武功350000层。") + "<br>" + LanResManager.getLanCommonTextWords("当前已使用") + suipian + LanResManager.getLanCommonTextWords("颗混沌碎片") + "<br>" + LanResManager.getLanCommonTextWords("增加攻击") + suipian * 1500 + LanResManager.getLanCommonTextWords("亿，所有武功") + suipian * 350000 + LanResManager.getLanCommonTextWords("层") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts1_1 = new FTextArea();
         this.fts1_1.x = 10 + 7;
         this.fts1_1.y = 7 + 20 + 20 + 137 + 20 + 20;
         this.fts1_1.textColor = StaticValue.GREEN;
         this.fts1_1.width = 200;
         this.fts1_1.height = 20;
         this.fts1_1.htmlText = new Goods(SpecialGoodsID.DIANFENGSHOU_YAOLIFUZHU_ID).res.name;
         this.fts1_1.visible = false;
         addChild(this.fts1_1);
         ToolTips.createToolTips(this.fts1_1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Đã kích hoạt Yêu Ly Chi Hồn" + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts2_1 = new FTextArea();
         this.fts2_1.x = 10 + 7;
         this.fts2_1.y = 7 + 20 + 20 + 137 + 20 + 20;
         this.fts2_1.textColor = StaticValue.GREEN;
         this.fts2_1.width = 200;
         this.fts2_1.height = 20;
         this.fts2_1.htmlText = new Goods(SpecialGoodsID.DIANFENGSHOU_HUNDUNFUZHU_ID).res.name;
         this.fts2_1.visible = false;
         addChild(this.fts2_1);
         ToolTips.createToolTips(this.fts2_1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Đã kích hoạt Hỗn Độn Ý Chí" + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts3_1 = new FTextArea();
         this.fts3_1.x = 10 + 7;
         this.fts3_1.y = 7 + 20 + 20 + 137 + 20 + 20;
         this.fts3_1.textColor = StaticValue.GREEN;
         this.fts3_1.width = 200;
         this.fts3_1.height = 20;
         this.fts3_1.htmlText = new Goods(SpecialGoodsID.DIANFENGSHOU_BIFANGFUZHU_ID).res.name;
         this.fts3_1.visible = false;
         addChild(this.fts3_1);
         ToolTips.createToolTips(this.fts3_1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Đã kích hoạt Tất Phương Chi Dực" + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts5_1 = new FTextArea();
         this.fts5_1.x = 314;
         this.fts5_1.y = 133;
         this.fts5_1.textColor = StaticValue.GREEN;
         this.fts5_1.width = 200;
         this.fts5_1.height = 20;
         this.fts5_1.htmlText = "Vọng Thiên Thần Đỉnh";
         this.fts5_1.visible = false;
         addChild(this.fts5_1);
         ToolTips.createToolTips(this.fts5_1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Đã kích hoạt Kim Cang Chi Thể" + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts6_1 = new FTextArea();
         this.fts6_1.x = 314;
         this.fts6_1.y = 133;
         this.fts6_1.textColor = StaticValue.GREEN;
         this.fts6_1.width = 200;
         this.fts6_1.height = 20;
         this.fts6_1.htmlText = "Hỏa Long Thần Đỉnh";
         this.fts6_1.visible = false;
         addChild(this.fts6_1);
         ToolTips.createToolTips(this.fts6_1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Hiệu quả: Sau khi kích hoạt Hỏa Long Thần Đỉnh," + "<br>" + "bản thân sẽ nhận được trạng thái Băng Hỏa Long" + "<br>" + "cho dù không cưỡi thú cưỡi Đỉnh Phong – Hỏa Long." + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.ynEquipSpr = new Sprite();
         addChild(this.ynEquipSpr);
         this.ynEquipSpr.x = 405;
         this.ynEquipSpr.y = 420;
         with(this.ynEquipSpr.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,40,40);
            endFill();
         }
         this.ynJihuoBtn = new SecondButton();
         this.ynJihuoBtn.x = 390;
         this.ynJihuoBtn.y = 490;
         this.ynJihuoBtn.label = LanResManager.getLanCommonTextWords("激活");
         this.ynJihuoBtn.addEventListener(MouseEvent.CLICK,this.onYNClick);
         addChild(this.ynJihuoBtn);
      }
      
      private function onYNClick(param1:MouseEvent) : void
      {
         this.bofangDuguYanhua();
         dispatchEvent(new BaseEvent(UI_YNJIHUOXUNZHANG,"",this.idArray[this.nowIndex]));
      }
      
      public function bofangDuguYanhua() : void
      {
         if(Boolean(this.yanhuaMc) && this.yanhuaMc.parent != null)
         {
            this.yanhuaMc.parent.removeChild(this.yanhuaMc);
         }
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            yanhuaMc = _loc2_.content as MovieClip;
            yanhuaMc.x = 300 - yanhuaMc.width / 2;
            yanhuaMc.y = 100 - yanhuaMc.height / 2;
            addChild(yanhuaMc);
         },null,false,GameConfig.fileBaseFolder + "res/data/mc/wabao.swf");
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         var _loc2_:ItemFace = null;
         var _loc3_:Goods = null;
         if(this.isMainChar)
         {
            _loc2_ = param1.target as ItemFace;
            if(_loc2_ == null)
            {
               return;
            }
            _loc3_ = _loc2_.getBaseItem() as Goods;
            if(_loc3_ == null)
            {
               return;
            }
            PipeManager.sendMsg(PipeConstants.UI_CHAR_ATTRIBUTE_MENU_SHOW,param1);
         }
      }
      
      private function onfoodClick(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(UI_DIANFENGSHOUPANEL_DRAG_UP));
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         this.foodContainer.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         this.p = new Point(mouseX,mouseY);
         this.currItem = param1.target as ItemFace;
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         if(this.currItem != param1.target)
         {
            this.foodContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            dispatchEvent(new BaseEvent(UI_DIANFENGSHOUPANEL_DRAG_DOWN,"",this.currItem));
            this.foodContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         }
      }
      
      private function onTextClick(param1:MouseEvent) : void
      {
         if(this.shuoMingPanel == null)
         {
            this.shuoMingPanel = new DianFengShouShuoMingPanel();
         }
         this.shuoMingPanel.x = GameConfig.sceneWidth / 2 - this.shuoMingPanel.width / 2;
         this.shuoMingPanel.y = GameConfig.sceneHeight / 2 - this.shuoMingPanel.height / 2;
         GameInstance.uiInstance.uiContainer.addChild(this.shuoMing);
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:Object = param1.target;
         switch(0)
         {
         }
         switch(param1.currentTarget)
         {
            case this.check:
               dispatchEvent(new BaseEvent(UI_DIANFENGSHOUPANEL_SHOW_CLICK,"",[this.idArray[this.nowIndex],this.check.selectState ? 1 : 0]));
         }
      }
      
      private function onBtnClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.jiHuoBtn:
               dispatchEvent(new BaseEvent(UI_DIANFENGSHOUPANEL_JIHUO_CLICK,"",[this.idArray[this.nowIndex],0]));
               break;
            case this.shouHuiBtn:
               dispatchEvent(new BaseEvent(UI_DIANFENGSHOUPANEL_QICHENG_CLICK,"",[this.idArray[this.nowIndex],0]));
               break;
            case this.qiChengBtn:
               dispatchEvent(new BaseEvent(UI_DIANFENGSHOUPANEL_QICHENG_CLICK,"",[this.idArray[this.nowIndex],1]));
               break;
            case this.preBtn:
               if(this.isMainChar)
               {
                  dispatchEvent(new BaseEvent(UI_DIANFENGSHOUPANEL_CHAKAN_CLICK,"",this.idArray[int(this.nowIndex / SHOW_COUNT_BTN - 1) * SHOW_COUNT_BTN]));
               }
               else
               {
                  this.$parent.dispatchEvent(new BaseEvent(TargetAttribute.UI_TARGETRIDE_DIANFENGSHOU_SHOW,"",this.idArray[int(this.nowIndex / SHOW_COUNT_BTN - 1) * SHOW_COUNT_BTN]));
               }
               break;
            case this.nextBtn:
               if(this.isMainChar)
               {
                  dispatchEvent(new BaseEvent(UI_DIANFENGSHOUPANEL_CHAKAN_CLICK,"",this.idArray[int(this.nowIndex / SHOW_COUNT_BTN + 1) * SHOW_COUNT_BTN]));
               }
               else
               {
                  this.$parent.dispatchEvent(new BaseEvent(TargetAttribute.UI_TARGETRIDE_DIANFENGSHOU_SHOW,"",this.idArray[int(this.nowIndex / SHOW_COUNT_BTN + 1) * SHOW_COUNT_BTN]));
               }
               break;
            case this.shuoMing:
               if(this.shuoMingPanel == null)
               {
                  this.shuoMingPanel = new DianFengShouShuoMingPanel();
               }
               this.shuoMingPanel.x = GameConfig.sceneWidth / 2 - this.shuoMingPanel.width / 2;
               this.shuoMingPanel.y = GameConfig.sceneHeight / 2 - this.shuoMingPanel.height / 2;
               if(Fun.isVisible(this.shuoMingPanel))
               {
                  this.shuoMingPanel.parent.removeChild(this.shuoMingPanel);
               }
               else
               {
                  GameInstance.uiInstance.uiContainer.addChild(this.shuoMingPanel);
               }
               break;
            case this.weiBtn:
               dispatchEvent(new BaseEvent(UI_DIANFENGSHOUPANEL_WEISHI_CLICK));
         }
      }
      
      public function setPanelData(param1:int, param2:Array, param3:PureMount, param4:int) : void
      {
         var ynArr:Array;
         var now:int = param1;
         var idArray:Array = param2;
         var pMount:PureMount = param3;
         var gongXun:int = param4;
         this.zuoqiByte = now;
         this.setJiHuo(true);
         this.nowGongXun = gongXun;
         this.needGongXun = pMount.needGongXun;
         this.pMount = pMount;
         this.setHeadBtn(now,idArray);
         this.setAddValue(pMount.mountAttributeInfo.append_ap,pMount.mountAttributeInfo.append_dp,pMount.mountAttributeInfo.append_cp,pMount.mountAttributeInfo.append_ev,pMount.mountAttributeInfo.append_hp);
         this.setLv(pMount.mountAttributeInfo.lv);
         ynArr = GameInstance.mainCharData.goodsInfo.goodsBodyArr;
         this.setYNequip(pMount.ynGoodID,pMount.ynState == 0 ? false : true,pMount.isHave);
         if(this.hateBar)
         {
            this.hateBar.gotoAndStop(int(pMount.nowHate / pMount.maxHate * 100));
         }
         else
         {
            LoadSwf.AndReturnMC(GameConfig.fileBaseFolder + "res/ui/UIditu/supermount/bar.swf",function(param1:MovieClip):*
            {
               if(param1)
               {
                  hateBar = param1;
                  hateBar.gotoAndStop(int(pMount.nowHate / pMount.maxHate * 100));
                  barSpr.addChild(hateBar);
                  hateBar.x = 50;
                  hateBar.y = 379;
               }
            });
         }
         this.jinDuLable.text = "" + pMount.nowHate + "/" + pMount.maxHate;
         this.setSkill(pMount.skillID,pMount.isHave);
         if(pMount.isHave)
         {
            if(pMount.fightStatus == 1)
            {
               this.jiHuoBtn.visible = false;
               this.shouHuiBtn.visible = true;
               this.qiChengBtn.visible = false;
            }
            else
            {
               this.jiHuoBtn.visible = false;
               this.shouHuiBtn.visible = false;
               this.qiChengBtn.visible = true;
            }
            this.check.enabled = true;
            this.check.selectState = pMount.isDefaultShow;
         }
         else
         {
            this.jiHuoBtn.visible = true;
            this.shouHuiBtn.visible = false;
            this.qiChengBtn.visible = false;
            this.check.enabled = false;
         }
      }
      
      public function setSkill(param1:int, param2:Boolean) : void
      {
         this.skillText.htmlText = "<textformat leading=\'4\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + this.pMount.skillContent + "</font></textformat>";
         while(this.skillSpr.numChildren != 0)
         {
            this.skillSpr.removeChildAt(0);
         }
         var _loc3_:Skill = new Skill(param1);
         _loc3_.isLearn = param2 ? 1 : 0;
         var _loc4_:ItemFace = new ItemFace(_loc3_);
         _loc4_.showKungFuTag();
         _loc4_.setShowCount(false);
         this.skillSpr.addChild(_loc4_);
      }
      
      public function setLv(param1:int) : void
      {
         while(this.lvImgSpr.numChildren != 0)
         {
            this.lvImgSpr.removeChildAt(0);
         }
      }
      
      public function setHeadBtn(param1:int, param2:Array) : void
      {
         var count:int;
         var i:int;
         var index:int = 0;
         var bg:DisplayObject = null;
         var len:int = 0;
         var btn:NewSkinButton = null;
         var now:int = param1;
         var idArray:Array = param2;
         while(this.bgSpr.numChildren != 0)
         {
            this.bgSpr.removeChildAt(0);
         }
         if(this.bgDict[now] == null)
         {
            bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/supermount/dianfeng" + now + ".swf");
            bg.x = 14;
            bg.y = 100;
            this.bgSpr.addChild(bg);
            this.bgDict[now] = bg;
         }
         else
         {
            this.bgSpr.addChild(this.bgDict[now]);
         }
         while(this.headBtnSpr.numChildren != 0)
         {
            this.headBtnSpr.removeChildAt(0);
         }
         while(this.selectSpr.numChildren != 0)
         {
            this.selectSpr.removeChildAt(0);
         }
         this.nowIndex = now;
         this.idArray = idArray;
         if(this.nowIndex >= idArray.length)
         {
            this.nowIndex = 0;
         }
         if(idArray.length > SHOW_COUNT_BTN)
         {
            this.preBtn.visible = true;
            this.nextBtn.visible = true;
            if(now >= SHOW_COUNT_BTN)
            {
               this.preBtn.enabled = true;
            }
            else
            {
               this.preBtn.enabled = false;
            }
            len = int(idArray.length);
            if(len % 5 != 0)
            {
               if(len > SHOW_COUNT_BTN && now < SHOW_COUNT_BTN * int(len / 5))
               {
                  this.nextBtn.enabled = true;
               }
               else
               {
                  this.nextBtn.enabled = false;
               }
            }
            else if(len > SHOW_COUNT_BTN && now < SHOW_COUNT_BTN * int(len / 5 - 1))
            {
               this.nextBtn.enabled = true;
            }
            else
            {
               this.nextBtn.enabled = false;
            }
         }
         else
         {
            this.preBtn.visible = false;
            this.nextBtn.visible = false;
         }
         index = int(now / SHOW_COUNT_BTN) * SHOW_COUNT_BTN;
         count = 0;
         i = index;
         while(i < index + SHOW_COUNT_BTN && i < idArray.length)
         {
            if(this.headBtnDict[i] == null)
            {
               btn = new NewSkinButton();
               btn.skin = "dianFengShou_btn_" + i;
               btn.name = "" + idArray[i];
               btn.addEventListener(MouseEvent.CLICK,this.onHeadBtnClick);
            }
            else
            {
               btn = this.headBtnDict[i];
            }
            btn.x = 75 * count;
            btn.y = 22;
            this.headBtnSpr.addChild(btn);
            if(i == now)
            {
               if(this.selectMc)
               {
                  this.selectSpr.addChild(this.selectMc);
                  this.selectMc.x = 75 * (now - index) - 17;
                  this.selectMc.y = -4;
                  this.selectSpr.x = this.headBtnSpr.x;
               }
               else
               {
                  LoadSwf.AndReturnMC(GameConfig.fileBaseFolder + "res/ui/UIditu/supermount/select.swf",function(param1:MovieClip):*
                  {
                     if(param1)
                     {
                        selectMc = param1;
                        selectSpr.addChild(selectMc);
                        selectMc.x = 75 * (now - index) - 17;
                        selectMc.y = -4;
                        selectSpr.x = headBtnSpr.x;
                     }
                  });
               }
            }
            count++;
            i++;
         }
         if(idArray.length <= SHOW_COUNT_BTN)
         {
            this.headBtnSpr.x = (470 - this.headBtnSpr.width) / 2;
            this.selectSpr.x = this.headBtnSpr.x;
         }
         else
         {
            this.headBtnSpr.x = 51;
            this.selectSpr.x = 51;
         }
      }
      
      private function onHeadBtnClick(param1:MouseEvent) : void
      {
         var _loc2_:NewSkinButton = param1.target as NewSkinButton;
         if(this.isMainChar)
         {
            dispatchEvent(new BaseEvent(UI_DIANFENGSHOUPANEL_CHAKAN_CLICK,"",parseInt(_loc2_.name)));
         }
         else
         {
            this.$parent.dispatchEvent(new BaseEvent(TargetAttribute.UI_TARGETRIDE_DIANFENGSHOU_SHOW,"",parseInt(_loc2_.name)));
         }
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         Tools.currentStage.addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = Tools.currentStage.mouseX + 15;
         this.tipCanvas.y = Tools.currentStage.mouseY + 25;
      }
      
      public function set avatar(param1:BitmapData) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         this._avatar.scaleX = this._avatar.scaleY = 1;
         this._avatar.bitmapData = param1;
         if(!param1)
         {
            return;
         }
         var _loc2_:int = 320;
         var _loc3_:int = 170 + 30;
         var _loc4_:Rectangle = this._avatar.bitmapData.getColorBoundsRect(4278190080,0,false);
         if(_loc4_.width > _loc2_ || _loc4_.height > _loc3_)
         {
            _loc5_ = _loc2_ / _loc4_.width;
            _loc6_ = _loc3_ / _loc4_.height;
            if(_loc5_ > _loc6_)
            {
               this._avatar.scaleX = this._avatar.scaleY = _loc6_;
            }
            else
            {
               this._avatar.scaleX = this._avatar.scaleY = _loc5_;
            }
         }
         this._avatar.y = -20 + (_loc3_ - this._avatar.height) / 2;
         this._avatar.x = -30 + (_loc2_ - this._avatar.width) / 2;
      }
      
      public function setAddValue(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
      }
      
      public function closeJiHuoPanel() : void
      {
         if(Boolean(this.jiHuoPanel) && Boolean(this.jiHuoPanel.parent))
         {
            this.jiHuoPanel.onClose();
         }
      }
      
      public function setParent(param1:DisplayObject) : void
      {
         this.$parent = param1;
      }
      
      private function reset() : void
      {
         this.hateBar.gotoAndStop(1);
         this.jinDuLable.text = "";
      }
      
      public function setTargetFun() : void
      {
         this.jiHuoBtn.enabled = false;
         this.qiChengBtn.enabled = false;
         this.shouHuiBtn.enabled = false;
         this.check.enabled = false;
         this.isMainChar = false;
         dragAble = false;
         this.shuoMing.enabled = false;
         this.setJiHuo(false);
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.zuoqiByte == 0)
            {
               this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.DIANFENGSHOU_DIANFENGSHI_ID];
               this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.DIANFENGSHOU_DIANFENGMIJI];
               if(GameState.dictMainStatus[SpecialGoodsID.DIANFENGSHOU_DIANFENGMIJI])
               {
                  this.foodContainer.visible = true;
                  this.weiBtn.visible = true;
                  this.kuang.visible = true;
               }
               else
               {
                  this.foodContainer.visible = false;
                  this.weiBtn.visible = false;
                  this.kuang.visible = false;
               }
            }
            else
            {
               this.fts1.visible = false;
               this.fts2.visible = false;
               this.foodContainer.visible = false;
               this.weiBtn.visible = false;
               this.kuang.visible = false;
            }
            this.fts3.visible = Boolean(GameState.dictMainStatus[SpecialGoodsID.DIANFENGSHOU_HUNDUJIHUOSHI_ID]) && this.zuoqiByte == 1;
            this.fts4.visible = Boolean(GameState.dictMainStatus[SpecialGoodsID.DIANFENGSHOU_KAITIAN_ID]) && this.zuoqiByte == 1;
            if(Boolean(GameState.dictMainStatus[SpecialGoodsID.DIANFENGSHOU_KAITIAN_ID]) && this.zuoqiByte == 1)
            {
               this.setSkillJiHuo(200358,true);
               this.mainSkillContainer.visible = true;
               this.kuang1.visible = true;
            }
            else
            {
               this.mainSkillContainer.visible = false;
               this.kuang1.visible = false;
            }
            this.fts5.visible = Boolean(GameState.dictMainStatus[SpecialGoodsID.DIANFENGSHOU_HUNDUNTIANSHU_ID]) && this.zuoqiByte == 1;
            this.suipian = GameState.dictMainStatus[SpecialGoodsID.DIANFENGSHOU_HUNDUNSUIPIAN_ID];
            this.fts1_1.visible = Boolean(GameState.dictMainStatus[SpecialGoodsID.DIANFENGSHOU_YAOLIFUZHU_ID]) && this.zuoqiByte == 0;
            this.fts2_1.visible = Boolean(GameState.dictMainStatus[SpecialGoodsID.DIANFENGSHOU_HUNDUNFUZHU_ID]) && this.zuoqiByte == 1;
            this.fts3_1.visible = Boolean(GameState.dictMainStatus[SpecialGoodsID.DIANFENGSHOU_BIFANGFUZHU_ID]) && this.zuoqiByte == 2;
            this.fts5_1.visible = Boolean(GameState.dictMainStatus[SpecialGoodsID.DIANFENGSHOU_WANGTIANSHENDING_ID]) && this.zuoqiByte == 4;
            this.fts6_1.visible = Boolean(GameState.dictMainStatus[730539]) && this.zuoqiByte == 5;
         }
         else
         {
            if(this.zuoqiByte == 0)
            {
               this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.DIANFENGSHOU_DIANFENGSHI_ID];
               this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.DIANFENGSHOU_DIANFENGMIJI];
               if(GameState.dictTargetStatus[SpecialGoodsID.DIANFENGSHOU_DIANFENGMIJI])
               {
                  this.foodContainer.visible = true;
                  this.weiBtn.visible = true;
                  this.kuang.visible = true;
               }
               else
               {
                  this.foodContainer.visible = false;
                  this.weiBtn.visible = false;
                  this.kuang.visible = false;
               }
            }
            else
            {
               this.fts1.visible = false;
               this.fts2.visible = false;
               this.foodContainer.visible = false;
               this.weiBtn.visible = false;
               this.kuang.visible = false;
            }
            this.fts3.visible = Boolean(GameState.dictTargetStatus[SpecialGoodsID.DIANFENGSHOU_HUNDUJIHUOSHI_ID]) && this.zuoqiByte == 1;
            this.fts4.visible = Boolean(GameState.dictTargetStatus[SpecialGoodsID.DIANFENGSHOU_KAITIAN_ID]) && this.zuoqiByte == 1;
            if(Boolean(GameState.dictTargetStatus[SpecialGoodsID.DIANFENGSHOU_KAITIAN_ID]) && this.zuoqiByte == 1)
            {
               this.setSkillJiHuo(200358,true);
               this.mainSkillContainer.visible = true;
               this.kuang1.visible = true;
            }
            else
            {
               this.mainSkillContainer.visible = false;
               this.kuang1.visible = false;
            }
            this.fts5.visible = Boolean(GameState.dictTargetStatus[SpecialGoodsID.DIANFENGSHOU_HUNDUNTIANSHU_ID]) && this.zuoqiByte == 1;
            this.suipian = GameState.dictTargetStatus[SpecialGoodsID.DIANFENGSHOU_HUNDUNSUIPIAN_ID];
            this.fts1_1.visible = Boolean(GameState.dictTargetStatus[SpecialGoodsID.DIANFENGSHOU_YAOLIFUZHU_ID]) && this.zuoqiByte == 0;
            this.fts2_1.visible = Boolean(GameState.dictTargetStatus[SpecialGoodsID.DIANFENGSHOU_HUNDUNFUZHU_ID]) && this.zuoqiByte == 1;
            this.fts3_1.visible = Boolean(GameState.dictTargetStatus[SpecialGoodsID.DIANFENGSHOU_BIFANGFUZHU_ID]) && this.zuoqiByte == 2;
            this.fts5_1.visible = Boolean(GameState.dictTargetStatus[SpecialGoodsID.DIANFENGSHOU_WANGTIANSHENDING_ID]) && this.zuoqiByte == 4;
            this.fts6_1.visible = Boolean(GameState.dictTargetStatus[730539]) && this.zuoqiByte == 5;
         }
      }
      
      public function JinHuaSetFood(param1:Goods = null) : void
      {
         this.food = param1;
         this.setFood(param1);
      }
      
      public function getFood() : Goods
      {
         return this.food;
      }
      
      public function setFood(param1:Goods = null) : void
      {
         while(this.foodContainer.numChildren > 0)
         {
            this.foodContainer.removeChildAt(0);
         }
         if(param1 == null)
         {
            return;
         }
         this.foodContainer.addChild(new ItemFace(param1));
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
               dispatchEvent(new BaseEvent(UI_DINGCHANJUE_SKILL_DRAG,"",this.currSkill));
            }
            this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
         }
      }
      
      private function onSkillMouseUp(param1:MouseEvent) : void
      {
         this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
      }
      
      public function setSkillJiHuo(param1:int, param2:Boolean) : void
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
         var _loc3_:Skill = new Skill(param1);
         if(param2)
         {
            _loc3_.isLearn = 1;
         }
         else
         {
            _loc3_.isLearn = 0;
         }
         this.mainSkillItemFace = new ItemFace(_loc3_);
         this.mainSkillItemFace.showKungFuTag();
         this.mainSkillItemFace.setShowCount(false);
         this.mainSkillContainer.addChild(this.mainSkillItemFace);
      }
      
      public function setYNequip(param1:int, param2:Boolean, param3:Boolean) : void
      {
         while(this.ynEquipSpr.numChildren > 0)
         {
            this.ynEquipSpr.removeChildAt(0);
         }
         var _loc4_:Goods = new Goods(param1);
         var _loc5_:Bitmap = StaticValue.getBitmapByClassName("ui.tiem.slot");
         _loc5_.x = 0;
         _loc5_.y = 0;
         this.ynEquipSpr.addChild(_loc5_);
         var _loc6_:ItemFace = new ItemFace(_loc4_);
         _loc6_.x = 2;
         _loc6_.y = 2;
         this.ynEquipSpr.addChild(_loc6_);
         _loc6_.setShowCount(false);
         if(param2)
         {
            _loc6_.filters = [];
            this.ynJihuoBtn.enabled = false;
         }
         else
         {
            _loc6_.filters = Tools.blackWhiteFilter;
            if(param3)
            {
               this.ynJihuoBtn.enabled = true;
            }
            else
            {
               this.ynJihuoBtn.enabled = false;
            }
         }
      }
   }
}

