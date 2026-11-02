package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.NewSkinButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.shell.view.components.autoFight.AutoFightMenuListRender;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.*;
   import flash.geom.Point;
   import flash.utils.setTimeout;
   
   public class WuHunPanel extends FPanel
   {
      
      public static const UI_WUHUNXITONG_WUHUN_CLICK:String = "UI_WUHUNXITONG_WUHUN_CLICK";
      
      public static const UI_WUHUNXITONG_ZHURU_CLICK:String = "UI_WUHUNXITONG_ZHURU_CLICK";
      
      public static const UI_WUHUNXITONG_CHUZHAN_CLICK:String = "UI_WUHUNXITONG_CHUZHAN_CLICK";
      
      public static const UI_WUHUNXITONG_ZHUANGBEI_CLICK:String = "UI_WUHUNXITONG_ZHUANGBEI_CLICK";
      
      public static const UI_WUHUNXITONG_XUANZELINGHUN_CLICK:String = "UI_WUHUNXITONG_XUANZELINGHUN_CLICK";
      
      public static const UI_WUHUNXITONG_SKILL_DRAG:String = "UI_WUHUNXITONG_SKILL_DRAG";
      
      public static const UI_WUHUNXITONG_EQUIP_DRAG:String = "UI_WUHUNXITONG_EQUIP_DRAG";
      
      private var bg:DisplayObject;
      
      private var bg2:DisplayObject;
      
      private var bg1:DisplayObject;
      
      private var listContainer:Sprite;
      
      private var giftList:FList;
      
      private var Scroll:FVScorllBar;
      
      private var fts1:FTextArea;
      
      private var shuxing:FTextArea;
      
      private var shengwang:FTextArea;
      
      private var zhuangbeiSpr1:Sprite;
      
      private var zhuangbeiSpr2:Sprite;
      
      private var zhuangbeiSpr3:Sprite;
      
      private var zhuangbeiSpr4:Sprite;
      
      private var jiantouBg1:DisplayObject;
      
      private var jiantouBg2:DisplayObject;
      
      private var skillSpr:Sprite;
      
      private var TCballSpr:Sprite;
      
      private var TCball1:MovieClip;
      
      private var TCball2:MovieClip;
      
      private var TCball3:MovieClip;
      
      private var huoYueDu:int = 0;
      
      private var miaoshuMc:MovieClip;
      
      private var dengjiMc:MovieClip;
      
      private var bgMc:MovieClip;
      
      private var wuhunMc:MovieClip;
      
      private var jinengSpr:Sprite;
      
      private var btn4:FSimpleButton;
      
      private var menuContainer4:FCanvas;
      
      private var menuList4:FList;
      
      private var shengwangType:int = 0;
      
      private var chuzhanBtn:NewSkinButton;
      
      private var shouhuiBtn:NewSkinButton;
      
      private var zhuruBtn:NewSkinButton;
      
      private var _avatar:Bitmap;
      
      private var currEquip:ItemFace;
      
      private var jiemianSpr:Sprite;
      
      private var mcObj:Array;
      
      private var mcObj1:Array;
      
      private var mcObj2:Array;
      
      private var mcObj3:Array;
      
      private var quan:DisplayObject;
      
      private var wuhunLv:int = 0;
      
      private var now:int = 0;
      
      private var max:int = 0;
      
      private var fts2:FTextArea;
      
      private var wuHunXieDi_XieDiZhenFa:FTextArea;
      
      private var wuHunLeiShen_LeiShenZhiShang:FTextArea;
      
      private var wuHunLeiShen_LeiShenZhiNu:FTextArea;
      
      private var wuHunLeiShen_LeiShenZhiChui:FTextArea;
      
      private var p:Point;
      
      private var kuang:Bitmap;
      
      private var mainSkill:Skill;
      
      private var mainSkillItemFace:ItemFace;
      
      private var mainSkillContainer:Sprite;
      
      private var currSkill:ItemFace;
      
      private var equipContainers:Sprite;
      
      private var kuangHD:Bitmap;
      
      private var isMain:Boolean;
      
      private var equipBo1:Boolean;
      
      private var equipBo2:Boolean;
      
      private var txt1:FTextArea;
      
      private var txt2:FTextArea;
      
      private var txt3:FTextArea;
      
      private var txt4:FTextArea;
      
      private var txt5:FTextArea;
      
      private var txt6:FTextArea;
      
      private var txt7:FTextArea;
      
      private var txt8:FTextArea;
      
      private var txt9:FTextArea;
      
      private var txt10:FTextArea;
      
      private var txt11:FTextArea;
      
      private var txt12:FTextArea;
      
      private var txt13:FTextArea;
      
      private var txt14:FTextArea;
      
      private var txt15:FTextArea;
      
      private var txt16:FTextArea;
      
      private var txt17:FTextArea;
      
      private var txt18:FTextArea;
      
      public function WuHunPanel()
      {
         var title:DisplayObject;
         var xiaohao:FTextArea = null;
         super();
         this.titleText = "";
         this.showCloseButton = true;
         this.skin = "panel";
         this.dragAble = true;
         width = 998 - 144;
         height = 498 + 38;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.jiemianSpr = new Sprite();
         addChild(this.jiemianSpr);
         title = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wuhun/title.swf");
         this.addChild(title);
         title.x = 400;
         title.y = -34;
         this.shuxing = new FTextArea();
         this.shuxing.x = 50 + 26;
         this.shuxing.y = 36 + 85;
         this.shuxing.textColor = StaticValue.GREEN;
         this.shuxing.width = 200;
         this.shuxing.height = 120;
         this.shuxing.htmlText = "";
         addChild(this.shuxing);
         xiaohao = new FTextArea();
         xiaohao.x = 10 + 30;
         xiaohao.y = 36 + 400 - 48;
         xiaohao.textColor = StaticValue.GREEN;
         xiaohao.width = 200;
         xiaohao.height = 20;
         xiaohao.htmlText = LanResManager.getLanCommonTextWords("当前消耗：");
         addChild(xiaohao);
         this.shengwang = new FTextArea();
         this.shengwang.x = 50 + 35 + 30;
         this.shengwang.y = 36 + 400 - 48;
         this.shengwang.textColor = StaticValue.GREEN;
         this.shengwang.width = 200;
         this.shengwang.height = 20;
         this.shengwang.htmlText = "";
         addChild(this.shengwang);
         this.listContainer = new Sprite();
         addChild(this.listContainer);
         with(this.listContainer)
         {
            x = 2 + 695;
            y = 160 - 152;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,145,480);
            graphics.endFill();
         }
         this.giftList = new FList();
         this.giftList.skin = "list";
         this.giftList.itemRenderer = new WuHunList();
         this.giftList.listWidth = 145;
         this.listContainer.addChild(this.giftList);
         this.giftList.x = 0;
         this.giftList.y = 0;
         this.giftList.addEventListener(MouseEvent.CLICK,this.onListClick);
         this.Scroll = new FVScorllBar(this.listContainer,480);
         addChild(this.Scroll);
         this.Scroll.x = 145 + 700;
         this.Scroll.y = 160 - 152;
         this.jinengSpr = new Sprite();
         this.jinengSpr.x = 325 + 33 - 45;
         this.jinengSpr.y = 300 + 20 + 50;
         addChild(this.jinengSpr);
         this.menuContainer4 = new FCanvas();
         this.menuContainer4.visible = false;
         this.menuContainer4.skin = "backGroud";
         this.menuContainer4.width = 81;
         this.menuContainer4.height = 104;
         this.menuContainer4.x = 75 + 131;
         this.menuContainer4.y = 235 + 114;
         addChild(this.menuContainer4);
         this.menuList4 = new FList();
         this.menuList4.skin = "menuList_chat";
         this.menuList4.listWidth = 60;
         this.menuList4.itemRenderer = new AutoFightMenuListRender();
         this.menuList4.x = this.menuList4.y = 2;
         this.menuContainer4.addChild(this.menuList4);
         this.menuList4.dataProvider = <list>
															<node show={LanResManager.getLanCommonTextWords("城战声望")} label="1"/>
															<node show={LanResManager.getLanCommonTextWords("论剑声望")} label="2"/>
															<node show={LanResManager.getLanCommonTextWords("夫妻竞技")} label="3"/>
															<node show={LanResManager.getLanCommonTextWords("卧虎藏龙")} label="4"/>
															<node show={LanResManager.getLanCommonTextWords("吞食天地")} label="5"/>
														</list>;
         this.menuList4.addEventListener(MouseEvent.CLICK,this.onListClick1);
         this.btn4 = new FSimpleButton();
         with(this.btn4)
         {
            skin = "nextButton";
            x = 137 + 50;
            y = 217 + 140;
            addEventListener(MouseEvent.CLICK,onShowMenu);
         }
         addChild(this.btn4);
         this.chuzhanBtn = new NewSkinButton();
         this.chuzhanBtn.skin = "wuhun_chuzhan_btn";
         this.chuzhanBtn.x = 500 - 215 + 17;
         this.chuzhanBtn.y = 500 - 70;
         addChild(this.chuzhanBtn);
         this.chuzhanBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.shouhuiBtn = new NewSkinButton();
         this.shouhuiBtn.skin = "wuhun_shouhui_btn";
         this.shouhuiBtn.visible = false;
         this.shouhuiBtn.x = 500 - 215 + 17;
         this.shouhuiBtn.y = 500 - 70;
         addChild(this.shouhuiBtn);
         this.shouhuiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.zhuruBtn = new NewSkinButton();
         this.zhuruBtn.skin = "wuhun_zhuru_btn";
         this.zhuruBtn.x = 100 - 35;
         this.zhuruBtn.y = 500 - 150;
         addChild(this.zhuruBtn);
         this.zhuruBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.zhuruBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("每次注入灵魂增加10点灵魂值。10点灵魂=100点声望。") + "</font>";
         this.zhuangbeiSpr1 = new Sprite();
         this.zhuangbeiSpr1.x = 270;
         this.zhuangbeiSpr1.y = 260 + 45 + 12;
         addChild(this.zhuangbeiSpr1);
         this.zhuangbeiSpr1.addEventListener(MouseEvent.CLICK,this.zbClick);
         this.zhuangbeiSpr2 = new Sprite();
         this.zhuangbeiSpr2.x = 270;
         this.zhuangbeiSpr2.y = 210 + 45;
         this.zhuangbeiSpr2.visible = false;
         addChild(this.zhuangbeiSpr2);
         this.zhuangbeiSpr2.addEventListener(MouseEvent.CLICK,this.thClick);
         this.jiantouBg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wuhun/jiantou.swf");
         addChild(this.jiantouBg1);
         this.jiantouBg1.visible = false;
         this.jiantouBg1.x = this.zhuangbeiSpr2.x - 2;
         this.jiantouBg1.y = this.zhuangbeiSpr2.y + 37;
         this.zhuangbeiSpr3 = new Sprite();
         this.zhuangbeiSpr3.x = 270 + 170;
         this.zhuangbeiSpr3.y = 260 + 45 + 12;
         addChild(this.zhuangbeiSpr3);
         this.zhuangbeiSpr3.addEventListener(MouseEvent.CLICK,this.zbClick);
         this.zhuangbeiSpr4 = new Sprite();
         this.zhuangbeiSpr4.x = 270 + 170;
         this.zhuangbeiSpr4.y = 210 + 45;
         this.zhuangbeiSpr4.visible = false;
         addChild(this.zhuangbeiSpr4);
         this.zhuangbeiSpr4.addEventListener(MouseEvent.CLICK,this.thClick);
         this.jiantouBg2 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wuhun/jiantou.swf");
         addChild(this.jiantouBg2);
         this.jiantouBg2.visible = false;
         this.jiantouBg2.x = this.zhuangbeiSpr4.x - 2;
         this.jiantouBg2.y = this.zhuangbeiSpr4.y + 37;
         this.fts1 = new FTextArea();
         this.fts1.x = 205 + 388;
         this.fts1.y = 36 + 430;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 200;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("玩法说明");
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("玩家需消耗对应的声望来提升灵魂池从而获得武魂外观，武魂可以为玩家提供特殊属性以及") + "<br>" + LanResManager.getLanCommonTextWords("稀有的技能效果，武魂可以携带装备来增加炎魔属性及强化炎魔技能效果。") + "<br>" + "</font>";
            _loc1_ += "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("注：武魂装备需要在武魂界面点击装备栏进行选择佩戴。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 10;
         this.fts2.y = 20;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 200;
         this.fts2.height = 20;
         this.fts2.htmlText = "炎魔之眼";
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊技能：炎魔之眼一旦开启，将使得炎魔激活天赋隐藏技能；攻击时100%触发炎魔" + "<br>" + "之眼，持续20秒；在此状态下，炎魔之眼可洞穿周围事物，将自身隐藏在其中；且在" + "<br>" + "此期间，自身只要攻击对手，都可对对手释放炎魔灼烧，将对手恐惧身体行动速度下降" + "<br>" + "至1点，且灼烧下的对手血量将始终保持在1点。BUFF不可清。冷却60秒。" + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.txt1 = new FTextArea();
         this.txt1.x = 10;
         this.txt1.y = 38;
         this.txt1.textColor = StaticValue.GREEN;
         this.txt1.width = 60;
         this.txt1.height = 20;
         this.txt1.htmlText = "炎魔（火）";
         this.txt1.visible = false;
         addChild(this.txt1);
         ToolTips.createToolTips(this.txt1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊效果：佩戴后增加攻击属性500%。" + "<br>" + "特殊属性：攻击400888亿、防御320888亿、血量320888亿、所有武功提升400000层" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt2 = new FTextArea();
         this.txt2.x = 10;
         this.txt2.y = 38;
         this.txt2.textColor = StaticValue.GREEN;
         this.txt2.width = 60;
         this.txt2.height = 20;
         this.txt2.htmlText = "邪帝（暗）";
         this.txt2.visible = false;
         addChild(this.txt2);
         ToolTips.createToolTips(this.txt2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊效果：佩戴后增加攻击属性500%。" + "<br>" + "特殊属性：攻击400888亿、防御320888亿、血量320888亿、所有武功提升400000层" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt3 = new FTextArea();
         this.txt3.x = 10;
         this.txt3.y = 38;
         this.txt3.textColor = StaticValue.GREEN;
         this.txt3.width = 60;
         this.txt3.height = 20;
         this.txt3.htmlText = "雷神（电）";
         this.txt3.visible = false;
         addChild(this.txt3);
         ToolTips.createToolTips(this.txt3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊效果：佩戴后增加攻击属性500%。" + "<br>" + "特殊属性：攻击400888亿、防御320888亿、血量320888亿、所有武功提升400000层" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt4 = new FTextArea();
         this.txt4.x = 10;
         this.txt4.y = 38;
         this.txt4.textColor = StaticValue.GREEN;
         this.txt4.width = 60;
         this.txt4.height = 20;
         this.txt4.htmlText = "风神（风）";
         this.txt4.visible = false;
         addChild(this.txt4);
         ToolTips.createToolTips(this.txt4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊效果：佩戴后增加攻击属性500%。" + "<br>" + "特殊属性：攻击400888亿、防御320888亿、血量320888亿、所有武功提升400000层" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt5 = new FTextArea();
         this.txt5.x = 10;
         this.txt5.y = 54;
         this.txt5.textColor = StaticValue.GREEN;
         this.txt5.width = 60;
         this.txt5.height = 20;
         this.txt5.htmlText = "炎魔战甲";
         this.txt5.visible = false;
         addChild(this.txt5);
         ToolTips.createToolTips(this.txt5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊效果：佩戴后增加人物全属性100%。" + "<br>" + "特殊属性：攻击110888亿、防御80888亿、血量80888亿、所有武功提升400000层" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt6 = new FTextArea();
         this.txt6.x = 10;
         this.txt6.y = 72;
         this.txt6.textColor = StaticValue.GREEN;
         this.txt6.width = 60;
         this.txt6.height = 20;
         this.txt6.htmlText = "炎魔战靴";
         this.txt6.visible = false;
         addChild(this.txt6);
         ToolTips.createToolTips(this.txt6,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊效果：佩戴后增加人物全属性100%。" + "<br>" + "特殊属性：攻击110888亿、防御80888亿、血量80888亿、所有武功提升400000层" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt7 = new FTextArea();
         this.txt7.x = 10;
         this.txt7.y = 90;
         this.txt7.textColor = StaticValue.GREEN;
         this.txt7.width = 60;
         this.txt7.height = 20;
         this.txt7.htmlText = "炎魔战盔";
         this.txt7.visible = false;
         addChild(this.txt7);
         ToolTips.createToolTips(this.txt7,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊效果：佩戴后增加人物全属性100%。" + "<br>" + "特殊属性：攻击110888亿、防御80888亿、血量80888亿、所有武功提升400000层" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt8 = new FTextArea();
         this.txt8.x = 10;
         this.txt8.y = 54;
         this.txt8.textColor = StaticValue.GREEN;
         this.txt8.width = 60;
         this.txt8.height = 20;
         this.txt8.htmlText = "邪帝战铠";
         this.txt8.visible = false;
         addChild(this.txt8);
         ToolTips.createToolTips(this.txt8,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊效果：佩戴后增加人物全属性100%。" + "<br>" + "特殊属性：攻击110888亿、防御80888亿、血量80888亿、所有武功提升400000层" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt9 = new FTextArea();
         this.txt9.x = 10;
         this.txt9.y = 72;
         this.txt9.textColor = StaticValue.GREEN;
         this.txt9.width = 60;
         this.txt9.height = 20;
         this.txt9.htmlText = "邪帝战靴";
         this.txt9.visible = false;
         addChild(this.txt9);
         ToolTips.createToolTips(this.txt9,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊效果：佩戴后增加人物全属性100%。" + "<br>" + "特殊属性：攻击110888亿、防御80888亿、血量80888亿、所有武功提升400000层" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt10 = new FTextArea();
         this.txt10.x = 10;
         this.txt10.y = 90;
         this.txt10.textColor = StaticValue.GREEN;
         this.txt10.width = 60;
         this.txt10.height = 20;
         this.txt10.htmlText = "邪帝护臂";
         this.txt10.visible = false;
         addChild(this.txt10);
         ToolTips.createToolTips(this.txt10,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊效果：佩戴后增加人物全属性100%。" + "<br>" + "特殊属性：攻击110888亿、防御80888亿、血量80888亿、所有武功提升400000层" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt11 = new FTextArea();
         this.txt11.x = 10;
         this.txt11.y = 108;
         this.txt11.textColor = StaticValue.GREEN;
         this.txt11.width = 60;
         this.txt11.height = 20;
         this.txt11.htmlText = "邪帝战盔";
         this.txt11.visible = false;
         addChild(this.txt11);
         ToolTips.createToolTips(this.txt11,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊效果：佩戴后增加人物全属性100%。" + "<br>" + "特殊属性：攻击110888亿、防御80888亿、血量80888亿、所有武功提升400000层" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt12 = new FTextArea();
         this.txt12.x = 10;
         this.txt12.y = 120;
         this.txt12.textColor = StaticValue.GREEN;
         this.txt12.width = 60;
         this.txt12.height = 20;
         this.txt12.htmlText = "邪帝真神";
         this.txt12.visible = false;
         addChild(this.txt12);
         ToolTips.createToolTips(this.txt12,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊技能：攻击时100%触发邪帝真神，持续10秒；在此状态下，对手将会被邪帝附体，不" + "<br>" + "管在此期间内对手做任何动作都将会被邪帝不断的施加封印，使其无法攻击；且在邪帝附" + "<br>" + "体期间内，对手将会不断的被邪毒所染，使对手不断的掉落30%血量；且在此状态下，所有" + "<br>" + "在邪帝的区域内都将会产生一个禁空的领域，使所有人都无法凌空跳跃，只能原地走动。" + "<br>" + "冷却60秒。" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt13 = new FTextArea();
         this.txt13.x = 10;
         this.txt13.y = 108;
         this.txt13.textColor = StaticValue.GREEN;
         this.txt13.width = 60;
         this.txt13.height = 20;
         this.txt13.htmlText = "化神炎魔";
         this.txt13.visible = false;
         addChild(this.txt13);
         ToolTips.createToolTips(this.txt13,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊技能：攻击时100%触发化身炎魔，持续10秒；在此状态下，集精气神幻化出巨灵炎魔，" + "<br>" + "所有攻击自己的技能都将会炎魔炎燃灭，且反噬对手一个炎魔弹，不仅炸飞对手并对对手" + "<br>" + "造成30%血量伤害；且在此状态下，巨灵炎魔将不断吸收攻击自身的伤害能量，不断的转化" + "<br>" + "成能源恢复自己的血量；在转化期间，对手只要被攻击都将会被炎魔封禁武学。冷却60秒。 " + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt14 = new FTextArea();
         this.txt14.x = 10;
         this.txt14.y = 54;
         this.txt14.textColor = StaticValue.GREEN;
         this.txt14.width = 60;
         this.txt14.height = 20;
         this.txt14.htmlText = "雷神盔甲";
         this.txt14.visible = false;
         addChild(this.txt14);
         ToolTips.createToolTips(this.txt14,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊效果：佩戴后增加人物全属性200%。" + "<br>" + "特殊属性：攻击110888亿、防御80888亿、血量80888亿、所有武功提升400000层" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt15 = new FTextArea();
         this.txt15.x = 10;
         this.txt15.y = 72;
         this.txt15.textColor = StaticValue.GREEN;
         this.txt15.width = 60;
         this.txt15.height = 20;
         this.txt15.htmlText = "雷神护盾";
         this.txt15.visible = false;
         addChild(this.txt15);
         ToolTips.createToolTips(this.txt15,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊效果：佩戴后增加人物全属性200%。" + "<br>" + "特殊属性：攻击110888亿、防御80888亿、血量80888亿、所有武功提升400000层" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt16 = new FTextArea();
         this.txt16.x = 10;
         this.txt16.y = 90;
         this.txt16.textColor = StaticValue.GREEN;
         this.txt16.width = 60;
         this.txt16.height = 20;
         this.txt16.htmlText = "雷神之矛";
         this.txt16.visible = false;
         addChild(this.txt16);
         ToolTips.createToolTips(this.txt16,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊效果：佩戴后增加人物全属性200%。" + "<br>" + "特殊属性：攻击110888亿、防御80888亿、血量80888亿、所有武功提升400000层" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt17 = new FTextArea();
         this.txt17.x = 10;
         this.txt17.y = 108;
         this.txt17.textColor = StaticValue.GREEN;
         this.txt17.width = 60;
         this.txt17.height = 20;
         this.txt17.htmlText = "雷神护肩";
         this.txt17.visible = false;
         addChild(this.txt17);
         ToolTips.createToolTips(this.txt17,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊效果：佩戴后增加人物全属性200%。" + "<br>" + "特殊属性：攻击110888亿、防御80888亿、血量80888亿、所有武功提升400000层" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt18 = new FTextArea();
         this.txt18.x = 10;
         this.txt18.y = 120;
         this.txt18.textColor = StaticValue.GREEN;
         this.txt18.width = 60;
         this.txt18.height = 20;
         this.txt18.htmlText = "天灭雷";
         this.txt18.visible = false;
         addChild(this.txt18);
         ToolTips.createToolTips(this.txt18,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊技能：攻击时100%触发天灭雷，持续10秒；在此状态下，自身掌控雷神秘技-天灭雷，" + "<br>" + "在自身范围内布下天灭雷，所有被自身攻击到的人，都将会被强制拉入天灭雷中享受天雷" + "<br>" + "轰击，所有被天雷轰击的人都将会被困住在原地，且所有强制抵抗天雷轰击的对手，都将" + "<br>" + "会被天雷轰击封印，使其失去所有的反抗攻击；且每次的雷击都将会给于对手造成30%的气" + "<br>" + "血。冷却60秒。" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this._avatar = new Bitmap();
         addChildAt(this._avatar,1);
         this.mcObj = new Array();
         this.mcObj1 = new Array();
         this.mcObj2 = new Array();
         this.mcObj3 = new Array();
         this.TCballSpr = new Sprite();
         addChild(this.TCballSpr);
         LoadSwf.AndReturnMC(GameConfig.fileBaseFolder + "res/ui/UIditu/wuhun/dengji_1.swf",function(param1:MovieClip):*
         {
            if(param1)
            {
               TCball1 = param1;
               TCball1.x = 45 + 20 + 22;
               TCball1.y = 107 + 120;
               TCball1.gotoAndStop(huoYueDu);
               TCballSpr.addChild(TCball1);
            }
         });
         LoadSwf.AndReturnMC(GameConfig.fileBaseFolder + "res/ui/UIditu/wuhun/dengji_2.swf",function(param1:MovieClip):*
         {
            if(param1)
            {
               TCball2 = param1;
               TCball2.x = 45 + 20 + 22;
               TCball2.y = 107 + 120;
               TCball2.gotoAndStop(huoYueDu);
               TCball2.visible = false;
               TCballSpr.addChild(TCball2);
            }
         });
         LoadSwf.AndReturnMC(GameConfig.fileBaseFolder + "res/ui/UIditu/wuhun/ball.swf",function(param1:MovieClip):*
         {
            if(param1)
            {
               TCball3 = param1;
               TCball3.x = 45 + 20 + 22;
               TCball3.y = 107 + 120;
               TCball3.visible = false;
               TCballSpr.addChild(TCball3);
            }
         });
         this.quan = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wuhun/quan.swf");
         this.quan.x = 10 + 20 + 22;
         this.quan.y = 2 + 218;
         addChild(this.quan);
         ToolTips.createToolTips(this.quan,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("武魂等级:") + wuhunLv + "<br>" + LanResManager.getLanCommonTextWords("当前武魂进度：") + now + "/" + max + "<br>" + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.wuHunXieDi_XieDiZhenFa = new FTextArea();
         this.wuHunXieDi_XieDiZhenFa.x = 260;
         this.wuHunXieDi_XieDiZhenFa.y = 50;
         this.wuHunXieDi_XieDiZhenFa.textColor = StaticValue.GREEN;
         this.wuHunXieDi_XieDiZhenFa.width = 32;
         this.wuHunXieDi_XieDiZhenFa.height = 20;
         this.wuHunXieDi_XieDiZhenFa.htmlText = "邪帝真法";
         addChild(this.wuHunXieDi_XieDiZhenFa);
         ToolTips.createToolTips(this.wuHunXieDi_XieDiZhenFa,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "被攻击时100%触发邪帝真法，持续20秒；在邪帝真法效果下，自身可以利用邪帝移形换位，只要受到一次攻击必定和对手换位一次，<br>" + "使自身所有负面清除且不在命中任何负面，对手将在移形换位后所有正面效果消失且定格在原地10秒，邪帝真法BUFF不可清。冷却60秒。<br>" + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.wuHunLeiShen_LeiShenZhiShang = new FTextArea();
         this.wuHunLeiShen_LeiShenZhiShang.x = 260 - 7;
         this.wuHunLeiShen_LeiShenZhiShang.y = 50;
         this.wuHunLeiShen_LeiShenZhiShang.textColor = StaticValue.GREEN;
         this.wuHunLeiShen_LeiShenZhiShang.width = 60;
         this.wuHunLeiShen_LeiShenZhiShang.height = 20;
         this.wuHunLeiShen_LeiShenZhiShang.htmlText = "雷神之伤";
         addChild(this.wuHunLeiShen_LeiShenZhiShang);
         ToolTips.createToolTips(this.wuHunLeiShen_LeiShenZhiShang,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊技能：佩戴雷神之伤后可开启雷神之伤BUFF，100%抵抗武魂炎魔。且雷神之怒及雷神之伤BUFF将产生共鸣，攻击时100%触发雷神制裁，持续20秒；<br>" + "在此状态下，对手被雷神制裁BUFF限制在原地；且不断受到雷神闪电攻击，对手一旦停止了跳跃将立即死亡。不可清。冷却60秒。<br>" + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.wuHunLeiShen_LeiShenZhiNu = new FTextArea();
         this.wuHunLeiShen_LeiShenZhiNu.x = 260 - 7;
         this.wuHunLeiShen_LeiShenZhiNu.y = 68;
         this.wuHunLeiShen_LeiShenZhiNu.textColor = StaticValue.GREEN;
         this.wuHunLeiShen_LeiShenZhiNu.width = 60;
         this.wuHunLeiShen_LeiShenZhiNu.height = 20;
         this.wuHunLeiShen_LeiShenZhiNu.htmlText = "雷神之怒";
         addChild(this.wuHunLeiShen_LeiShenZhiNu);
         ToolTips.createToolTips(this.wuHunLeiShen_LeiShenZhiNu,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊技能：佩戴雷神之怒后可开启雷神之怒BUFF，100%抵抗武魂邪帝。且雷神之怒及雷神之伤BUFF将产生共鸣，攻击时100%触发雷神制裁，持续20秒；<br>" + "在此状态下，对手被雷神制裁BUFF限制在原地；且不断受到雷神闪电攻击，对手一旦停止了跳跃将立即死亡。不可清。冷却60秒。<br>" + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.wuHunLeiShen_LeiShenZhiChui = new FTextArea();
         this.wuHunLeiShen_LeiShenZhiChui.x = 260 - 7;
         this.wuHunLeiShen_LeiShenZhiChui.y = 86;
         this.wuHunLeiShen_LeiShenZhiChui.textColor = StaticValue.GREEN;
         this.wuHunLeiShen_LeiShenZhiChui.width = 60;
         this.wuHunLeiShen_LeiShenZhiChui.height = 20;
         this.wuHunLeiShen_LeiShenZhiChui.htmlText = "雷神之锤";
         addChild(this.wuHunLeiShen_LeiShenZhiChui);
         ToolTips.createToolTips(this.wuHunLeiShen_LeiShenZhiChui,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊技能：佩戴雷神之锤后可开启雷神之锤BUFF，100%抵抗襄阳主宰。且攻击时100%触发雷神之锤，持续20秒；自身在此状态下，每次攻击都可使用<br>" + "雷神锤锤击对手将对手的神智击溃，且期间对手需脱下身上的神兵利器，在BUFF结束时若身上仍有神兵对手将直接被雷电击穿死亡，BUFF不可清。冷却60秒。<br>" + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.mainSkillContainer = new Sprite();
         this.mainSkillContainer.x = 325 + 29;
         this.mainSkillContainer.y = 300 + 74;
         addChild(this.mainSkillContainer);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onSkillMouseDown);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_UP,this.onSkillMouseUp);
         this.equipContainers = new Sprite();
         this.equipContainers.x = 343 + 8 + 5 - 90;
         this.equipContainers.y = 12 + 30 + 135 + 65 - 234 + 315 + 45;
         with(this.equipContainers.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,40,40);
            endFill();
         }
         this.equipContainers.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick00,false,30);
         addChild(this.equipContainers);
      }
      
      private function onItemClick00(param1:MouseEvent) : void
      {
         this.dispatchEvent(new BaseEvent(UI_WUHUNXITONG_EQUIP_DRAG,"",param1));
      }
      
      public function set_WuHunEquip(param1:Array) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         while(this.equipContainers.numChildren > 0)
         {
            this.equipContainers.removeChildAt(0);
         }
         this.equipBo1 = false;
         this.equipBo2 = false;
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_] as Goods;
            _loc4_ = new ItemFace(_loc3_);
            if(_loc3_.res.position == ItemPositionRange.POSTION_WUHUNXITONG_EQUIP[0])
            {
               this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.equipContainers.addChild(this.kuangHD);
               this.kuangHD.x = 0;
               this.kuangHD.y = 0;
               _loc4_.x = 2;
               _loc4_.y = 2 + 0;
               this.equipContainers.addChild(_loc4_);
               if(_loc4_ != null)
               {
                  this.equipBo1 = true;
               }
               else
               {
                  this.equipBo1 = false;
               }
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_WUHUNXITONG_EQUIP[1])
            {
               this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.equipContainers.addChild(this.kuangHD);
               this.kuangHD.x = 174;
               this.kuangHD.y = 0;
               _loc4_.x = 2 + 174;
               _loc4_.y = 2 + 0;
               this.equipContainers.addChild(_loc4_);
               if(_loc4_ != null)
               {
                  this.equipBo2 = true;
               }
               else
               {
                  this.equipBo2 = false;
               }
            }
            _loc2_++;
         }
         if(this.equipBo1 && this.equipBo2)
         {
            this.setEquipSkill(200593);
         }
         else
         {
            this.setEquipSkill(200592);
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
               this.dispatchEvent(new BaseEvent(UI_WUHUNXITONG_SKILL_DRAG,"",this.currSkill));
            }
            this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
         }
      }
      
      public function setEquipSkill(param1:int) : void
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
         var _loc2_:Skill = new Skill(param1);
         if(_loc2_ == null)
         {
            return;
         }
         this.mainSkill = _loc2_;
         this.mainSkill.isLearn = 1;
         this.mainSkillItemFace = new ItemFace(this.mainSkill);
         this.mainSkillItemFace.showKungFuTag();
         this.mainSkillItemFace.setShowCount(false);
         this.mainSkillContainer.addChild(this.mainSkillItemFace);
      }
      
      private function onSkillMouseUp(param1:MouseEvent) : void
      {
         this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
      }
      
      private function zbClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.zhuangbeiSpr1:
               this.zhuangbeiSpr2.visible = !this.zhuangbeiSpr2.visible;
               this.jiantouBg1.visible = this.zhuangbeiSpr2.visible;
               break;
            case this.zhuangbeiSpr3:
               this.zhuangbeiSpr4.visible = !this.zhuangbeiSpr4.visible;
               this.jiantouBg2.visible = this.zhuangbeiSpr4.visible;
         }
         switch(param1.target.name)
         {
            case "1":
               this.zhuangbeiSpr2.visible = !this.zhuangbeiSpr2.visible;
               this.jiantouBg1.visible = this.zhuangbeiSpr2.visible;
               break;
            case "2":
               this.zhuangbeiSpr4.visible = !this.zhuangbeiSpr4.visible;
               this.jiantouBg2.visible = this.zhuangbeiSpr4.visible;
         }
      }
      
      private function thClick(param1:MouseEvent) : void
      {
         this.currEquip = param1.target as ItemFace;
         var _loc2_:Goods = this.currEquip.getItem() as Goods;
         this.dispatchEvent(new BaseEvent(UI_WUHUNXITONG_ZHUANGBEI_CLICK,"",this.currEquip));
         this.zhuangbeiSpr2.visible = false;
         this.zhuangbeiSpr4.visible = false;
         this.jiantouBg1.visible = false;
         this.jiantouBg2.visible = false;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(this.wuhunLv == 0)
         {
            return;
         }
         switch(param1.target)
         {
            case this.chuzhanBtn:
               this.dispatchEvent(new BaseEvent(UI_WUHUNXITONG_CHUZHAN_CLICK,"",[this.giftList.selectItem.id,1]));
               break;
            case this.shouhuiBtn:
               this.dispatchEvent(new BaseEvent(UI_WUHUNXITONG_CHUZHAN_CLICK,"",[this.giftList.selectItem.id,0]));
               break;
            case this.zhuruBtn:
               if(this.shengwangType == 0)
               {
                  this.menuContainer4.visible = true;
               }
               this.dispatchEvent(new BaseEvent(UI_WUHUNXITONG_ZHURU_CLICK,"",this.giftList.selectItem.id));
         }
      }
      
      private function onShowMenu(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btn4:
               this.menuContainer4.visible = !this.menuContainer4.visible;
         }
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onListClick1(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.menuList4:
               this.shengwangType = this.menuList4.selectItem.label;
               this.menuContainer4.visible = false;
               this.shengwang.htmlText = this.menuList4.selectItem.show;
               this.dispatchEvent(new BaseEvent(UI_WUHUNXITONG_XUANZELINGHUN_CLICK,"",[this.giftList.selectItem.id,this.shengwangType]));
         }
      }
      
      private function onListClick(param1:MouseEvent) : void
      {
         if(this.giftList.selectItem == null)
         {
            return;
         }
         this.dispatchEvent(new BaseEvent(UI_WUHUNXITONG_WUHUN_CLICK,"",this.giftList.selectItem.id));
      }
      
      public function setList(param1:Array) : void
      {
         this.giftList.dataProvider = param1;
         this.Scroll.update();
         this.giftList.setSelectItemByIndex(0);
      }
      
      private function setShengWang(param1:int) : String
      {
         switch(param1)
         {
            case 1:
               return LanResManager.getLanCommonTextWords("城战声望");
            case 2:
               return LanResManager.getLanCommonTextWords("论剑声望");
            case 3:
               return LanResManager.getLanCommonTextWords("夫妻竞技");
            case 4:
               return LanResManager.getLanCommonTextWords("卧虎藏龙");
            case 5:
               return LanResManager.getLanCommonTextWords("吞食天地");
            default:
               return "";
         }
      }
      
      public function setPanel(param1:Object, param2:Object, param3:int, param4:Boolean, param5:int, param6:int, param7:int, param8:Array, param9:int, param10:Array) : void
      {
         var wuhunObj:Object = param1;
         var shuxingObj:Object = param2;
         var $shengwangType:int = param3;
         var isChuZhan:Boolean = param4;
         var skill1:int = param5;
         var skill2:int = param6;
         var equip1:int = param7;
         var zhuangbeiArr1:Array = param8;
         var equip2:int = param9;
         var zhuangbeiArr2:Array = param10;
         this.wuhunLv = wuhunObj.lv;
         this.now = wuhunObj.now;
         this.max = wuhunObj.max;
         this.chuzhanBtn.visible = !isChuZhan;
         this.shouhuiBtn.visible = isChuZhan;
         this.shengwangType = $shengwangType;
         this.shengwang.htmlText = this.setShengWang(this.shengwangType);
         if(wuhunObj.lv == 0)
         {
            this.btn4.enabled = false;
            this.zhuruBtn.filters = Tools.blackWhiteFilter;
            this.chuzhanBtn.filters = Tools.blackWhiteFilter;
         }
         else
         {
            this.btn4.enabled = true;
            this.zhuruBtn.filters = [];
            this.chuzhanBtn.filters = [];
         }
         if(wuhunObj.lv == 3)
         {
         }
         this.shuxing.htmlText = "<font color = \'" + StaticValue.GOLD_HTML + "\'>" + LanResManager.getLanCommonTextWords("青龙战纹") + ":" + shuxingObj.qinglong + "%<br>" + LanResManager.getLanCommonTextWords("白虎战纹") + ":" + shuxingObj.baihu + "%<br>" + LanResManager.getLanCommonTextWords("朱雀战纹") + ":" + shuxingObj.zhuque + "%<br>" + LanResManager.getLanCommonTextWords("玄武战纹") + shuxingObj.xuanwu + "%<br></font>";
         this.setSkill(skill1,skill2,wuhunObj.lv);
         this.setZhuangbei(equip1,zhuangbeiArr1,equip2,zhuangbeiArr2);
         this.setBg(wuhunObj.id,wuhunObj.lv);
         setTimeout(function():void
         {
            setValue(wuhunObj);
         },1000);
         this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.WUHUN_YANMOZHIYAN_ID];
         if(wuhunObj.id == 1)
         {
            this.txt1.visible = GameState.dictMainStatus[SpecialGoodsID.WUHUN_YANMOHUO_ID];
            this.txt2.visible = false;
            this.txt3.visible = false;
            this.txt4.visible = false;
            this.txt5.visible = GameState.dictMainStatus[SpecialGoodsID.WUHUN_YANMOZHANJIA_ID];
            this.txt6.visible = GameState.dictMainStatus[SpecialGoodsID.WUHUN_YANMOZHANXUE_ID];
            this.txt7.visible = GameState.dictMainStatus[SpecialGoodsID.WUHUN_YANMOZHANKUI_ID];
            this.txt8.visible = false;
            this.txt9.visible = false;
            this.txt10.visible = false;
            this.txt11.visible = false;
            this.txt12.visible = false;
            this.txt13.visible = GameState.dictMainStatus[SpecialGoodsID.WUHUN_HUASHENYANMO_ID];
            this.txt14.visible = false;
            this.txt15.visible = false;
            this.txt16.visible = false;
            this.txt17.visible = false;
            this.txt18.visible = false;
         }
         else if(wuhunObj.id == 2)
         {
            this.txt1.visible = false;
            this.txt2.visible = GameState.dictMainStatus[SpecialGoodsID.WUHUN_XIEDIAN_ID];
            this.txt3.visible = false;
            this.txt4.visible = false;
            this.txt5.visible = false;
            this.txt6.visible = false;
            this.txt7.visible = false;
            this.txt8.visible = GameState.dictMainStatus[SpecialGoodsID.WUHUN_XIEDIZHANKAI_ID];
            this.txt9.visible = GameState.dictMainStatus[SpecialGoodsID.WUHUN_XIEDIZHANXUE_ID];
            this.txt10.visible = GameState.dictMainStatus[SpecialGoodsID.WUHUN_XIEDIHUBI_ID];
            this.txt11.visible = GameState.dictMainStatus[SpecialGoodsID.WUHUN_XIEDIZHANKUI_ID];
            this.txt12.visible = GameState.dictMainStatus[SpecialGoodsID.WUHUN_XIEDIZHENSHEN_ID];
            this.txt13.visible = false;
            this.txt14.visible = false;
            this.txt15.visible = false;
            this.txt16.visible = false;
            this.txt17.visible = false;
            this.txt18.visible = false;
         }
         else if(wuhunObj.id == 3)
         {
            this.txt1.visible = false;
            this.txt2.visible = false;
            this.txt3.visible = GameState.dictMainStatus[SpecialGoodsID.WUHUN_LEISHENDIAN_ID];
            this.txt4.visible = false;
            this.txt5.visible = false;
            this.txt6.visible = false;
            this.txt7.visible = false;
            this.txt8.visible = false;
            this.txt9.visible = false;
            this.txt10.visible = false;
            this.txt11.visible = false;
            this.txt12.visible = false;
            this.txt13.visible = false;
            this.txt14.visible = GameState.dictMainStatus[SpecialGoodsID.WUHUN_LEISHENKUIJIA_ID];
            this.txt15.visible = GameState.dictMainStatus[SpecialGoodsID.WUHUN_LEISHENHUDUN_ID];
            this.txt16.visible = GameState.dictMainStatus[SpecialGoodsID.WUHUN_LEISHENZHIMAO_ID];
            this.txt17.visible = GameState.dictMainStatus[SpecialGoodsID.WUHUN_LEISHENHUJIAN_ID];
            this.txt18.visible = GameState.dictMainStatus[SpecialGoodsID.WUHUN_TIANMIELEI_ID];
         }
         else if(wuhunObj.id == 4)
         {
            this.txt1.visible = false;
            this.txt2.visible = false;
            this.txt3.visible = false;
            this.txt4.visible = GameState.dictMainStatus[SpecialGoodsID.WUHUN_FENGSHENFENG_ID];
            this.txt5.visible = false;
            this.txt6.visible = false;
            this.txt7.visible = false;
            this.txt8.visible = false;
            this.txt9.visible = false;
            this.txt10.visible = false;
            this.txt11.visible = false;
            this.txt12.visible = false;
            this.txt13.visible = false;
            this.txt14.visible = false;
            this.txt15.visible = false;
            this.txt16.visible = false;
            this.txt17.visible = false;
            this.txt18.visible = false;
         }
         if(wuhunObj.id == 2)
         {
            this.wuHunXieDi_XieDiZhenFa.visible = GameState.dictMainStatus[SpecialGoodsID.WUHUN_XIEDIZHENFA_ID];
         }
         else
         {
            this.wuHunXieDi_XieDiZhenFa.visible = false;
         }
         if(wuhunObj.id == 3)
         {
            this.mainSkillContainer.visible = GameState.dictMainStatus[SpecialGoodsID.WUHUN_KAITIANJI_ID];
            this.equipContainers.visible = true;
            this.wuHunLeiShen_LeiShenZhiShang.visible = GameState.dictMainStatus[SpecialGoodsID.WUHUN_LEISHENZHISHANG_ID];
            this.wuHunLeiShen_LeiShenZhiNu.visible = GameState.dictMainStatus[SpecialGoodsID.WUHUN_LEISHENZHINU_ID];
            this.wuHunLeiShen_LeiShenZhiChui.visible = GameState.dictMainStatus[SpecialGoodsID.WUHUN_LEISHENZHICHUI_ID];
         }
         else
         {
            this.mainSkillContainer.visible = false;
            this.equipContainers.visible = false;
            this.wuHunLeiShen_LeiShenZhiShang.visible = false;
            this.wuHunLeiShen_LeiShenZhiNu.visible = false;
            this.wuHunLeiShen_LeiShenZhiChui.visible = false;
         }
      }
      
      private function setValue(param1:Object) : void
      {
         if(param1.lv < 2)
         {
            if(this.TCball1 != null)
            {
               this.TCball1.visible = true;
            }
            if(this.TCball2 != null)
            {
               this.TCball2.visible = false;
            }
            if(this.TCball3 != null)
            {
               this.TCball3.visible = false;
            }
         }
         else if(param1.lv == 2)
         {
            if(this.TCball1 != null)
            {
               this.TCball1.visible = false;
            }
            if(this.TCball2 != null)
            {
               this.TCball2.visible = true;
            }
            if(this.TCball3 != null)
            {
               this.TCball3.visible = false;
            }
         }
         else
         {
            if(this.TCball1 != null)
            {
               this.TCball1.visible = false;
            }
            if(this.TCball2 != null)
            {
               this.TCball2.visible = false;
            }
            if(this.TCball3 != null)
            {
               this.TCball3.visible = true;
            }
         }
         this.huoYueDu = Math.floor(param1.now / param1.max * 100);
         if(this.TCball1 != null)
         {
            this.TCball1.gotoAndStop(this.huoYueDu);
         }
         if(this.TCball2 != null)
         {
            this.TCball2.gotoAndStop(this.huoYueDu);
         }
      }
      
      private function setBg(param1:int, param2:int) : void
      {
         var mcId:int = 0;
         var loadUrl:String = null;
         var loadUrl3:String = null;
         var loadUrl2:String = null;
         var loadUrl4:String = null;
         var id:int = param1;
         var v1:int = param2;
         mcId = id;
         loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/wuhun/wuhunbg_" + mcId + ".swf";
         if(Boolean(this.wuhunMc) && this.wuhunMc.parent != null)
         {
            this.wuhunMc.stop();
            this.wuhunMc.parent.removeChild(this.wuhunMc);
         }
         if(Boolean(this.bgMc) && this.bgMc.parent != null)
         {
            this.bgMc.stop();
            this.bgMc.parent.removeChild(this.bgMc);
         }
         if(Boolean(this.dengjiMc) && this.dengjiMc.parent != null)
         {
            this.dengjiMc.stop();
            this.dengjiMc.parent.removeChild(this.dengjiMc);
         }
         if(Boolean(this.miaoshuMc) && this.miaoshuMc.parent != null)
         {
            this.miaoshuMc.stop();
            this.miaoshuMc.parent.removeChild(this.miaoshuMc);
         }
         while(this.jiemianSpr.numChildren > 0)
         {
            this.jiemianSpr.removeChildAt(0);
         }
         if(this.mcObj2[mcId] != null)
         {
            this.bgMc = this.mcObj2[mcId];
            this.bgMc.play();
            this.jiemianSpr.addChild(this.bgMc);
         }
         else
         {
            loadUrl3 = GameConfig.fileBaseFolder + "res/ui/UIditu/wuhun/bg_" + mcId + ".swf";
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               if(_loc2_.url.url != loadUrl3)
               {
                  return;
               }
               bgMc = _loc2_.content as MovieClip;
               mcObj2[mcId] = bgMc;
               bgMc.x = 10;
               bgMc.y = 2;
               if(bgMc)
               {
                  jiemianSpr.addChildAt(bgMc,0);
               }
            },null,false,loadUrl3);
         }
         if(this.mcObj[mcId] != null)
         {
            this.wuhunMc = this.mcObj[mcId];
            this.wuhunMc.play();
            this.jiemianSpr.addChild(this.wuhunMc);
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
               wuhunMc = _loc2_.content as MovieClip;
               mcObj[mcId] = wuhunMc;
               wuhunMc.x = 250;
               wuhunMc.y = 47;
               if(wuhunMc)
               {
                  jiemianSpr.addChild(wuhunMc);
               }
            },null,false,loadUrl);
         }
         if(this.mcObj1[mcId] != null)
         {
            this.miaoshuMc = this.mcObj1[mcId];
            this.miaoshuMc.play();
            this.jiemianSpr.addChild(this.miaoshuMc);
         }
         else
         {
            loadUrl2 = GameConfig.fileBaseFolder + "res/ui/UIditu/wuhun/miaoshu_" + mcId + ".swf";
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               if(_loc2_.url.url != loadUrl2)
               {
                  return;
               }
               miaoshuMc = _loc2_.content as MovieClip;
               mcObj1[mcId] = miaoshuMc;
               miaoshuMc.x = 45 + 480;
               miaoshuMc.y = 107 - 80;
               if(miaoshuMc)
               {
                  jiemianSpr.addChild(miaoshuMc);
               }
            },null,false,loadUrl2);
         }
         if(this.mcObj3[v1] != null)
         {
            this.dengjiMc = this.mcObj3[v1];
            this.dengjiMc.play();
            this.jiemianSpr.addChild(this.dengjiMc);
         }
         else
         {
            loadUrl4 = GameConfig.fileBaseFolder + "res/ui/UIditu/wuhun/lv_" + mcId + "_" + v1 + ".swf";
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               if(_loc2_.url.url != loadUrl4)
               {
                  return;
               }
               dengjiMc = _loc2_.content as MovieClip;
               mcObj3[v1] = dengjiMc;
               dengjiMc.x = 310 - 52;
               dengjiMc.y = 250 - 90;
               if(dengjiMc)
               {
                  jiemianSpr.addChild(dengjiMc);
               }
            },null,false,loadUrl4);
         }
      }
      
      private function setZhuangbei(param1:int, param2:Array, param3:int, param4:Array) : void
      {
         var _loc5_:Bitmap = null;
         var _loc6_:int = 0;
         var _loc7_:ItemFace = null;
         var _loc8_:Array = null;
         var _loc9_:Goods = null;
         var _loc10_:ItemFace = null;
         var _loc11_:Goods = null;
         var _loc12_:ItemFace = null;
         while(this.zhuangbeiSpr1.numChildren > 0)
         {
            this.zhuangbeiSpr1.removeChildAt(0);
         }
         _loc5_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.zhuangbeiSpr1.addChild(_loc5_);
         _loc5_.x = -2;
         _loc5_.y = -2;
         while(this.zhuangbeiSpr2.numChildren > 0)
         {
            this.zhuangbeiSpr2.removeChildAt(0);
         }
         if(param1 > 0)
         {
            _loc7_ = new ItemFace(new Goods(param1));
            _loc7_.name = "1";
            this.zhuangbeiSpr1.addChild(_loc7_);
         }
         _loc6_ = 0;
         while(_loc6_ < param2.length)
         {
            _loc8_ = GameInstance.mainCharData.goodsInfo.getGoodsArrByID(param2[_loc6_],true);
            _loc9_ = _loc8_[0];
            if(_loc9_ == null)
            {
               _loc9_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param2[_loc6_],true);
            }
            _loc10_ = new ItemFace(_loc9_);
            _loc10_.x = 40 * _loc6_;
            _loc10_.setShowCount(false);
            this.zhuangbeiSpr2.addChild(_loc10_);
            if(_loc9_.count > 0)
            {
               _loc10_.filters = [];
            }
            else
            {
               _loc10_.filters = Tools.blackWhiteFilter;
            }
            _loc6_++;
         }
         while(this.zhuangbeiSpr3.numChildren > 0)
         {
            this.zhuangbeiSpr3.removeChildAt(0);
         }
         _loc5_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.zhuangbeiSpr3.addChild(_loc5_);
         _loc5_.x = -2;
         _loc5_.y = -2;
         while(this.zhuangbeiSpr4.numChildren > 0)
         {
            this.zhuangbeiSpr4.removeChildAt(0);
         }
         if(param3 > 0)
         {
            _loc7_ = new ItemFace(new Goods(param3));
            _loc7_.name = "2";
            this.zhuangbeiSpr3.addChild(_loc7_);
         }
         _loc6_ = 0;
         while(_loc6_ < param4.length)
         {
            _loc8_ = GameInstance.mainCharData.goodsInfo.getGoodsArrByID(param4[_loc6_],true);
            _loc11_ = _loc8_[0];
            if(_loc11_ == null)
            {
               _loc11_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param4[_loc6_],true);
            }
            _loc12_ = new ItemFace(_loc11_);
            _loc12_.x = 40 * _loc6_;
            _loc12_.setShowCount(false);
            this.zhuangbeiSpr4.addChild(_loc12_);
            if(_loc11_.count > 0)
            {
               _loc12_.filters = [];
            }
            else
            {
               _loc12_.filters = Tools.blackWhiteFilter;
            }
            _loc6_++;
         }
      }
      
      public function setSkill(param1:int, param2:int, param3:int) : void
      {
         var _loc6_:Bitmap = null;
         var _loc7_:ItemFace = null;
         var _loc8_:ItemFace = null;
         while(this.jinengSpr.numChildren > 0)
         {
            this.jinengSpr.removeChildAt(0);
         }
         var _loc4_:Skill = new Skill(param1);
         var _loc5_:Skill = new Skill(param2);
         if(param3 == 2)
         {
            _loc4_.isLearn = 1;
            _loc5_.isLearn = 0;
         }
         else if(param3 == 3)
         {
            _loc4_.isLearn = 1;
            _loc5_.isLearn = 1;
         }
         else
         {
            _loc4_.isLearn = 0;
            _loc5_.isLearn = 0;
         }
         _loc6_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.jinengSpr.addChild(_loc6_);
         _loc6_.x = -2;
         _loc6_.y = -2;
         _loc6_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.jinengSpr.addChild(_loc6_);
         _loc6_.x = -2 + 80;
         _loc6_.y = -2;
         _loc7_ = new ItemFace(_loc4_);
         _loc7_.showKungFuTag();
         _loc7_.setShowCount(false);
         this.jinengSpr.addChild(_loc7_);
         _loc8_ = new ItemFace(_loc5_);
         _loc8_.showKungFuTag();
         _loc8_.setShowCount(false);
         _loc8_.x = 80;
         this.jinengSpr.addChild(_loc8_);
      }
      
      public function set avatar(param1:BitmapData) : void
      {
         this._avatar.bitmapData = param1;
         if(!param1)
         {
            return;
         }
         this._avatar.x = 100 - this._avatar.width / 2 + 35 + 8 - 6 + 244;
         this._avatar.y = 110 - this._avatar.height + 40 + 13 + 21 + 7 + 149;
      }
   }
}

