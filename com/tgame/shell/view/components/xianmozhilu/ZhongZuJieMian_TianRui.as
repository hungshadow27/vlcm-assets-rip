package com.tgame.shell.view.components.xianmozhilu
{
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.NewSkinButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.PipeManager;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class ZhongZuJieMian_TianRui extends Sprite
   {
      
      public var _parent:DisplayObject;
      
      private var boxContainer:Sprite;
      
      private var xiaohao:FLabel;
      
      private var beibao:FLabel;
      
      private var txtTip:FLabel;
      
      private var btnShengJie:NewSkinButton;
      
      private var txtHuanZhuang:FLabel;
      
      private var checkHuanZhuang:FCheckBox;
      
      private var ft1:FTextArea;
      
      private var ft2:FTextArea;
      
      private var check2:FCheckBox;
      
      private var ft3:FTextArea;
      
      private var check3:FCheckBox;
      
      private var ft4:FTextArea;
      
      private var check4:FCheckBox;
      
      private var ft5:FTextArea;
      
      private var check5:FCheckBox;
      
      private var ft6:FTextArea;
      
      private var check6:FCheckBox;
      
      private var ft7:FTextArea;
      
      private var ft8:FTextArea;
      
      private var ft9:FTextArea;
      
      private var ft10:FTextArea;
      
      private var ft11:FTextArea;
      
      private var ft12:FTextArea;
      
      private var ft12num:int;
      
      private var ft13:FTextArea;
      
      private var ft13num:int;
      
      private var ft14:FTextArea;
      
      private var ft15:FTextArea;
      
      private var ft15num:int;
      
      private var ft16:FTextArea;
      
      private var ft17:FTextArea;
      
      private var ft18:FTextArea;
      
      private var ft19:FTextArea;
      
      private var ft20:FTextArea;
      
      private var ft21:FTextArea;
      
      private var ft22:FTextArea;
      
      private var ft23:FTextArea;
      
      private var ft24:FTextArea;
      
      private var p:Point;
      
      private var mainSkillContainer:Sprite;
      
      private var currSkill:ItemFace;
      
      private var kuang1:Bitmap;
      
      private var itemFace1:ItemFace;
      
      private var kuang2:Bitmap;
      
      private var itemFace2:ItemFace;
      
      private var ft400664:FTextArea;
      
      private var check400664:FCheckBox;
      
      private var ft400665:FTextArea;
      
      private var check400665:FCheckBox;
      
      private var ft400666:FTextArea;
      
      private var check400666:FCheckBox;
      
      private var ft400667:FTextArea;
      
      private var check400667:FCheckBox;
      
      private var ft401811:FTextArea;
      
      private var arrQiXuan:Array;
      
      private var arrStar:Array;
      
      public function ZhongZuJieMian_TianRui()
      {
         var bg:DisplayObject;
         var skill:Skill;
         super();
         bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/xianmozhilu/tianrui/bg.swf");
         bg.x = 10;
         bg.y = 22;
         addChild(bg);
         this.boxContainer = new Sprite();
         addChild(this.boxContainer);
         this.initUI();
         this.initStar();
         this.xiaohao = new FLabel();
         this.xiaohao.textColor = StaticValue.YELLOW;
         this.xiaohao.filters = StaticValue.filter;
         this.xiaohao.x = 80 + 90;
         this.xiaohao.y = 315 + 9;
         addChild(this.xiaohao);
         this.beibao = new FLabel();
         this.beibao.textColor = StaticValue.YELLOW;
         this.beibao.filters = StaticValue.filter;
         this.beibao.x = 80 + 90;
         this.beibao.y = 335 + 8;
         addChild(this.beibao);
         this.txtTip = new FLabel();
         this.txtTip.textColor = StaticValue.GREEN;
         this.txtTip.filters = StaticValue.filter;
         this.txtTip.text = "技能效果";
         this.txtTip.x = 370;
         this.txtTip.y = 290;
         addChild(this.txtTip);
         ToolTips.createToolTips(this.txtTip,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "第一层技能效果：被攻击超过30次，恢复满血，冷却30秒；" + "<br>" + "第二层技能效果：被攻击超过25次，恢复满血，冷却20秒；" + "<br>" + "第三层技能效果：被攻击超过20次，恢复满血，冷却10秒；" + "<br>" + "第四层技能效果：被攻击超过15次，恢复满血，冷却5秒；" + "<br>" + "第五层技能效果：被攻击超过10次，恢复满血，无冷却。" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.btnShengJie = new NewSkinButton();
         this.btnShengJie.skin = "tianwen_Button";
         this.btnShengJie.x = 155;
         this.btnShengJie.y = 360;
         addChild(this.btnShengJie);
         this.btnShengJie.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.txtHuanZhuang = new FLabel();
         this.txtHuanZhuang.x = 320;
         this.txtHuanZhuang.y = 370;
         this.txtHuanZhuang.textColor = StaticValue.YELLOW;
         this.txtHuanZhuang.filters = StaticValue.filter;
         this.txtHuanZhuang.width = 110;
         this.txtHuanZhuang.height = 20;
         this.txtHuanZhuang.text = "显示气旋";
         addChild(this.txtHuanZhuang);
         this.checkHuanZhuang = new FCheckBox();
         this.checkHuanZhuang.enabled = false;
         addChild(this.checkHuanZhuang);
         this.checkHuanZhuang.x = 385;
         this.checkHuanZhuang.y = 370;
         this.checkHuanZhuang.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.ft1 = new FTextArea();
         this.ft1.x = 15;
         this.ft1.y = 30;
         this.ft1.textColor = StaticValue.GREEN;
         this.ft1.filters = Tools.borderFilter;
         this.ft1.width = 100;
         this.ft1.height = 20;
         this.ft1.htmlText = "华山论剑(已激活)";
         this.ft1.visible = false;
         addChild(this.ft1);
         ToolTips.createToolTips(this.ft1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊效果：激活华山论剑后可获得不同的神兵幻化。" + "<br>" + "特殊技能：战斗时100%触发华山论剑，持续10秒；在东邪效果下，对手不断的受到碧海潮生效果，神智" + "<br>" + "不清方向混乱，且使对手七窍流血，每次掉落60%的生命；在西毒效果下，对手每次受到攻击都将会导致" + "<br>" + "毒气攻心，全身体力全失无法攻击；且在南帝效果下，自身的每次攻击都将会定住对手的穴脉，使对手的" + "<br>" + "移动受阻，不可跳跃或移动；且在北丐效果下，每次攻击都将会在对手周围造成漫天棍影，从不同的方向" + "<br>" + "攻击对手，瞬间击破对手的无敌状态；且在中神通的效果下，自身周围形成漫天幻影掌，使对手的所有攻" + "<br>" + "击效果全部被遮挡住。冷却60秒。" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.ft2 = new FTextArea();
         this.ft2.x = 15;
         this.ft2.y = 48;
         this.ft2.textColor = StaticValue.GREEN;
         this.ft2.filters = Tools.borderFilter;
         this.ft2.width = 70;
         this.ft2.height = 20;
         this.ft2.htmlText = "东邪黄药师";
         this.ft2.visible = false;
         addChild(this.ft2);
         ToolTips.createToolTips(this.ft2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊属性：佩戴后增加2000%全属性。" + "<br>" + "特殊属性：攻击1200888亿、防御1260888亿、血量1260888亿、所有武功提升1200000层。" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.check2 = new FCheckBox();
         addChild(this.check2);
         this.check2.x = 100;
         this.check2.y = 48;
         this.check2.addEventListener(MouseEvent.CLICK,this.onCheckClickHandler);
         this.ft3 = new FTextArea();
         this.ft3.x = 15;
         this.ft3.y = 66;
         this.ft3.textColor = StaticValue.GREEN;
         this.ft3.filters = Tools.borderFilter;
         this.ft3.width = 70;
         this.ft3.height = 20;
         this.ft3.htmlText = "西毒欧阳锋";
         this.ft3.visible = false;
         addChild(this.ft3);
         ToolTips.createToolTips(this.ft3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊属性：佩戴后增加2000%全属性。" + "<br>" + "特殊属性：攻击1200888亿、防御1260888亿、血量1260888亿、所有武功提升1200000层。" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.check3 = new FCheckBox();
         addChild(this.check3);
         this.check3.x = 100;
         this.check3.y = 66;
         this.check3.addEventListener(MouseEvent.CLICK,this.onCheckClickHandler);
         this.ft4 = new FTextArea();
         this.ft4.x = 15;
         this.ft4.y = 84;
         this.ft4.textColor = StaticValue.GREEN;
         this.ft4.filters = Tools.borderFilter;
         this.ft4.width = 70;
         this.ft4.height = 20;
         this.ft4.htmlText = "南帝段大师";
         this.ft4.visible = false;
         addChild(this.ft4);
         ToolTips.createToolTips(this.ft4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊属性：佩戴后增加2000%全属性。" + "<br>" + "特殊属性：攻击1200888亿、防御1260888亿、血量1260888亿、所有武功提升1200000层。" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.check4 = new FCheckBox();
         addChild(this.check4);
         this.check4.x = 100;
         this.check4.y = 84;
         this.check4.addEventListener(MouseEvent.CLICK,this.onCheckClickHandler);
         this.ft5 = new FTextArea();
         this.ft5.x = 15;
         this.ft5.y = 102;
         this.ft5.textColor = StaticValue.GREEN;
         this.ft5.filters = Tools.borderFilter;
         this.ft5.width = 70;
         this.ft5.height = 20;
         this.ft5.htmlText = "北丐洪七公";
         this.ft5.visible = false;
         addChild(this.ft5);
         ToolTips.createToolTips(this.ft5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊属性：佩戴后增加2000%全属性。" + "<br>" + "特殊属性：攻击1200888亿、防御1260888亿、血量1260888亿、所有武功提升1200000层。" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.check5 = new FCheckBox();
         addChild(this.check5);
         this.check5.x = 100;
         this.check5.y = 102;
         this.check5.addEventListener(MouseEvent.CLICK,this.onCheckClickHandler);
         this.ft6 = new FTextArea();
         this.ft6.x = 15;
         this.ft6.y = 120;
         this.ft6.textColor = StaticValue.GREEN;
         this.ft6.filters = Tools.borderFilter;
         this.ft6.width = 80;
         this.ft6.height = 20;
         this.ft6.htmlText = "中神通王重阳";
         this.ft6.visible = false;
         addChild(this.ft6);
         ToolTips.createToolTips(this.ft6,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊属性：佩戴后增加2000%全属性。" + "<br>" + "特殊属性：攻击1200888亿、防御1260888亿、血量1260888亿、所有武功提升1200000层。" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.check6 = new FCheckBox();
         addChild(this.check6);
         this.check6.x = 100;
         this.check6.y = 120;
         this.check6.addEventListener(MouseEvent.CLICK,this.onCheckClickHandler);
         this.ft7 = new FTextArea();
         this.ft7.x = 15;
         this.ft7.y = 120;
         this.ft7.textColor = StaticValue.GREEN;
         this.ft7.filters = Tools.borderFilter;
         this.ft7.width = 80;
         this.ft7.height = 20;
         this.ft7.htmlText = "九阴还魂丹";
         this.ft7.visible = false;
         addChild(this.ft7);
         ToolTips.createToolTips(this.ft7,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + new Goods(SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN).res.desc + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.ft8 = new FTextArea();
         this.ft8.x = 15;
         this.ft8.y = 138;
         this.ft8.textColor = StaticValue.GREEN;
         this.ft8.filters = Tools.borderFilter;
         this.ft8.width = 80;
         this.ft8.height = 20;
         this.ft8.htmlText = "花之剑兰";
         this.ft8.visible = false;
         addChild(this.ft8);
         ToolTips.createToolTips(this.ft8,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + new Goods(SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN8).res.desc + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.ft9 = new FTextArea();
         this.ft9.x = 15;
         this.ft9.y = 156;
         this.ft9.textColor = StaticValue.GREEN;
         this.ft9.filters = Tools.borderFilter;
         this.ft9.width = 80;
         this.ft9.height = 20;
         this.ft9.htmlText = "花之文竹";
         this.ft9.visible = false;
         addChild(this.ft9);
         ToolTips.createToolTips(this.ft9,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + new Goods(SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN9).res.desc + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.ft10 = new FTextArea();
         this.ft10.x = 15;
         this.ft10.y = 174;
         this.ft10.textColor = StaticValue.GREEN;
         this.ft10.filters = Tools.borderFilter;
         this.ft10.width = 80;
         this.ft10.height = 20;
         this.ft10.htmlText = "花之银柳";
         this.ft10.visible = false;
         addChild(this.ft10);
         ToolTips.createToolTips(this.ft10,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + new Goods(SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN10).res.desc + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.ft11 = new FTextArea();
         this.ft11.x = 15;
         this.ft11.y = 192;
         this.ft11.textColor = StaticValue.GREEN;
         this.ft11.filters = Tools.borderFilter;
         this.ft11.width = 80;
         this.ft11.height = 20;
         this.ft11.htmlText = "狮子星石";
         this.ft11.visible = false;
         addChild(this.ft11);
         ToolTips.createToolTips(this.ft11,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + new Goods(SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN11).res.desc + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.ft12 = new FTextArea();
         this.ft12.x = 15;
         this.ft12.y = 210;
         this.ft12.textColor = StaticValue.GREEN;
         this.ft12.filters = Tools.borderFilter;
         this.ft12.width = 80;
         this.ft12.height = 20;
         this.ft12.htmlText = "剑池劫";
         this.ft12.visible = false;
         addChild(this.ft12);
         ToolTips.createToolTips(this.ft12,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "已使用：" + ft12num + "<br>" + new Goods(SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN12).res.desc + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.ft13 = new FTextArea();
         this.ft13.x = 15;
         this.ft13.y = 228;
         this.ft13.textColor = StaticValue.GREEN;
         this.ft13.filters = Tools.borderFilter;
         this.ft13.width = 80;
         this.ft13.height = 20;
         this.ft13.htmlText = "灵兵阁";
         this.ft13.visible = false;
         addChild(this.ft13);
         ToolTips.createToolTips(this.ft13,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "已使用：" + ft13num + "<br>" + new Goods(SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN13).res.desc + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.ft14 = new FTextArea();
         this.ft14.x = 15;
         this.ft14.y = 246;
         this.ft14.textColor = StaticValue.GREEN;
         this.ft14.filters = Tools.borderFilter;
         this.ft14.width = 80;
         this.ft14.height = 20;
         this.ft14.htmlText = "鸳鸯石";
         this.ft14.visible = false;
         addChild(this.ft14);
         ToolTips.createToolTips(this.ft14,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + new Goods(SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN14).res.desc + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.ft15 = new FTextArea();
         this.ft15.x = 15;
         this.ft15.y = 264;
         this.ft15.textColor = StaticValue.GREEN;
         this.ft15.filters = Tools.borderFilter;
         this.ft15.width = 80;
         this.ft15.height = 20;
         this.ft15.htmlText = "1点感恩值";
         this.ft15.visible = false;
         addChild(this.ft15);
         ToolTips.createToolTips(this.ft15,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "已获得：" + ft15num + "点感恩值" + "<br>" + new Goods(SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN15).res.desc + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.ft16 = new FTextArea();
         this.ft16.x = 15;
         this.ft16.y = 282;
         this.ft16.textColor = StaticValue.GREEN;
         this.ft16.filters = Tools.borderFilter;
         this.ft16.width = 100;
         this.ft16.height = 20;
         this.ft16.htmlText = "嘉年华盛典宝录";
         this.ft16.visible = false;
         addChild(this.ft16);
         ToolTips.createToolTips(this.ft16,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + new Goods(SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN16).res.desc + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.ft17 = new FTextArea();
         this.ft17.x = 15;
         this.ft17.y = 300;
         this.ft17.textColor = StaticValue.GREEN;
         this.ft17.filters = Tools.borderFilter;
         this.ft17.width = 100;
         this.ft17.height = 20;
         this.ft17.htmlText = "内功修为养成诀";
         this.ft17.visible = false;
         addChild(this.ft17);
         ToolTips.createToolTips(this.ft17,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + new Goods(SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN17).res.desc + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.ft18 = new FTextArea();
         this.ft18.x = 15;
         this.ft18.y = 318;
         this.ft18.textColor = StaticValue.GREEN;
         this.ft18.filters = Tools.borderFilter;
         this.ft18.width = 100;
         this.ft18.height = 20;
         this.ft18.htmlText = "平安夜碎片";
         this.ft18.visible = false;
         addChild(this.ft18);
         ToolTips.createToolTips(this.ft18,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + new Goods(SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN18).res.desc + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.ft19 = new FTextArea();
         this.ft19.x = 15 + 130;
         this.ft19.y = 30;
         this.ft19.textColor = StaticValue.GREEN;
         this.ft19.filters = Tools.borderFilter;
         this.ft19.width = 100;
         this.ft19.height = 20;
         this.ft19.htmlText = "龙彩心魂";
         this.ft19.visible = false;
         addChild(this.ft19);
         ToolTips.createToolTips(this.ft19,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + new Goods(SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN19).res.desc + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.ft20 = new FTextArea();
         this.ft20.x = 15 + 130;
         this.ft20.y = 48;
         this.ft20.textColor = StaticValue.GREEN;
         this.ft20.filters = Tools.borderFilter;
         this.ft20.width = 100;
         this.ft20.height = 20;
         this.ft20.htmlText = "羽翼心魂";
         this.ft20.visible = false;
         addChild(this.ft20);
         ToolTips.createToolTips(this.ft20,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + new Goods(SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN20).res.desc + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.ft21 = new FTextArea();
         this.ft21.x = 15 + 130;
         this.ft21.y = 66;
         this.ft21.textColor = StaticValue.GREEN;
         this.ft21.filters = Tools.borderFilter;
         this.ft21.width = 100;
         this.ft21.height = 20;
         this.ft21.htmlText = "赤珠心魂";
         this.ft21.visible = false;
         addChild(this.ft21);
         ToolTips.createToolTips(this.ft21,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + new Goods(SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN21).res.desc + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.ft22 = new FTextArea();
         this.ft22.x = 15 + 130;
         this.ft22.y = 84;
         this.ft22.textColor = StaticValue.GREEN;
         this.ft22.filters = Tools.borderFilter;
         this.ft22.width = 100;
         this.ft22.height = 20;
         this.ft22.htmlText = "玄焱心魂";
         this.ft22.visible = false;
         addChild(this.ft22);
         ToolTips.createToolTips(this.ft22,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + new Goods(SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN22).res.desc + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.ft23 = new FTextArea();
         this.ft23.x = 15 + 130;
         this.ft23.y = 102;
         this.ft23.textColor = StaticValue.GREEN;
         this.ft23.filters = Tools.borderFilter;
         this.ft23.width = 100;
         this.ft23.height = 20;
         this.ft23.htmlText = "1月青铜特权卡";
         this.ft23.visible = false;
         addChild(this.ft23);
         ToolTips.createToolTips(this.ft23,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + new Goods(SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN23).res.desc + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.ft24 = new FTextArea();
         this.ft24.x = 15 + 130;
         this.ft24.y = 120;
         this.ft24.textColor = StaticValue.GREEN;
         this.ft24.filters = Tools.borderFilter;
         this.ft24.width = 100;
         this.ft24.height = 20;
         this.ft24.htmlText = "电魂残卷之一";
         this.ft24.visible = false;
         ToolTips.createToolTips(this.ft24,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + new Goods(SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN24).res.desc + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.mainSkillContainer = new Sprite();
         addChild(this.mainSkillContainer);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onSkillMouseDown);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_UP,this.onSkillMouseUp);
         this.kuang1 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.kuang1.x = 378;
         this.kuang1.y = 248;
         this.mainSkillContainer.addChild(this.kuang1);
         skill = new Skill(200952);
         skill.isLearn = 1;
         this.itemFace1 = new ItemFace(skill);
         this.itemFace1.showKungFuTag();
         this.itemFace1.setShowCount(false);
         this.itemFace1.x = 380;
         this.itemFace1.y = 250;
         this.mainSkillContainer.addChild(this.itemFace1);
         this.kuang2 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.kuang2.x = 378 - 55;
         this.kuang2.y = 248;
         this.mainSkillContainer.addChild(this.kuang2);
         skill = new Skill(200964);
         skill.isLearn = 1;
         this.itemFace2 = new ItemFace(skill);
         this.itemFace2.showKungFuTag();
         this.itemFace2.setShowCount(false);
         this.itemFace2.x = 380 - 55;
         this.itemFace2.y = 250;
         this.mainSkillContainer.addChild(this.itemFace2);
         this.ft400664 = new FTextArea();
         this.ft400664.x = 15 + 130;
         this.ft400664.y = 120;
         this.ft400664.textColor = StaticValue.GREEN;
         this.ft400664.filters = Tools.borderFilter;
         this.ft400664.width = 100;
         this.ft400664.height = 20;
         this.ft400664.htmlText = "SSR-光明之剑";
         this.ft400664.visible = false;
         addChild(this.ft400664);
         ToolTips.createToolTips(this.ft400664,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + new Goods(SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN400664).res.desc + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.ft400665 = new FTextArea();
         this.ft400665.x = 15 + 130;
         this.ft400665.y = 138;
         this.ft400665.textColor = StaticValue.GREEN;
         this.ft400665.filters = Tools.borderFilter;
         this.ft400665.width = 100;
         this.ft400665.height = 20;
         this.ft400665.htmlText = "SSR-黑暗之剑";
         this.ft400665.visible = false;
         addChild(this.ft400665);
         ToolTips.createToolTips(this.ft400665,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + new Goods(SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN400665).res.desc + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.ft400666 = new FTextArea();
         this.ft400666.x = 15 + 130;
         this.ft400666.y = 156;
         this.ft400666.textColor = StaticValue.GREEN;
         this.ft400666.filters = Tools.borderFilter;
         this.ft400666.width = 100;
         this.ft400666.height = 20;
         this.ft400666.htmlText = "SSR-空间之剑";
         this.ft400666.visible = false;
         addChild(this.ft400666);
         ToolTips.createToolTips(this.ft400666,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + new Goods(SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN400666).res.desc + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.ft400667 = new FTextArea();
         this.ft400667.x = 15 + 130;
         this.ft400667.y = 174;
         this.ft400667.textColor = StaticValue.GREEN;
         this.ft400667.filters = Tools.borderFilter;
         this.ft400667.width = 100;
         this.ft400667.height = 20;
         this.ft400667.htmlText = "SSR-时间之剑";
         this.ft400667.visible = false;
         addChild(this.ft400667);
         ToolTips.createToolTips(this.ft400667,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + new Goods(SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN400667).res.desc + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.ft401811 = new FTextArea();
         this.ft401811.x = 15 + 130;
         this.ft401811.y = 192;
         this.ft401811.textColor = StaticValue.GREEN;
         this.ft401811.filters = Tools.borderFilter;
         this.ft401811.width = 100;
         this.ft401811.height = 20;
         this.ft401811.htmlText = "狗年生肖丹";
         this.ft401811.visible = false;
         addChild(this.ft401811);
         ToolTips.createToolTips(this.ft401811,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + new Goods(SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN401811).res.desc + "<br>";
            return _loc1_ + "</textformat>";
         });
      }
      
      private function onCheckClickHandler(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.check2:
               this._parent.dispatchEvent(new BaseEvent(ZhongZuJieMianPanel.XIANMOZHILU_JIHUO_SHOW,"",[this.check2.selectState,SpecialGoodsID.XIANMO_DONGXIE]));
               break;
            case this.check3:
               this._parent.dispatchEvent(new BaseEvent(ZhongZuJieMianPanel.XIANMOZHILU_JIHUO_SHOW,"",[this.check3.selectState,SpecialGoodsID.XIANMO_XIDU]));
               break;
            case this.check4:
               this._parent.dispatchEvent(new BaseEvent(ZhongZuJieMianPanel.XIANMOZHILU_JIHUO_SHOW,"",[this.check4.selectState,SpecialGoodsID.XIANMO_NANDI]));
               break;
            case this.check5:
               this._parent.dispatchEvent(new BaseEvent(ZhongZuJieMianPanel.XIANMOZHILU_JIHUO_SHOW,"",[this.check5.selectState,SpecialGoodsID.XIANMO_BEIGAI]));
               break;
            case this.check6:
               this._parent.dispatchEvent(new BaseEvent(ZhongZuJieMianPanel.XIANMOZHILU_JIHUO_SHOW,"",[this.check6.selectState,SpecialGoodsID.XIANMO_ZHONGSHENTONG]));
         }
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         this._parent.dispatchEvent(new BaseEvent(ZhongZuJieMianPanel.UI_XIANMOTIANRUI_GOUXUAN,"",int(this.checkHuanZhuang.selectState)));
      }
      
      private function onItemClick00(param1:MouseEvent) : void
      {
         this._parent.dispatchEvent(new BaseEvent(ZhongZuJieMianPanel.UI_ZHONGZUJIEMIAN_MENU_SHOW,"",param1));
      }
      
      private function onClickHandler(param1:MouseEvent) : void
      {
         this._parent.dispatchEvent(new Event(ZhongZuJieMianPanel.UI_XIANMOTIANRUI_SHENGJIE));
      }
      
      private function initUI() : void
      {
         var _loc2_:DisplayObject = null;
         this.arrQiXuan = new Array();
         var _loc1_:int = 0;
         while(_loc1_ < 5)
         {
            _loc2_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/xianmozhilu/tianrui/" + (_loc1_ + 1) + ".swf");
            addChild(_loc2_);
            this.arrQiXuan.push(_loc2_);
            if(_loc1_ == 0)
            {
               _loc2_.x = 225;
               _loc2_.y = 25;
            }
            if(_loc1_ == 1)
            {
               _loc2_.x = 85;
               _loc2_.y = 25;
            }
            if(_loc1_ == 2)
            {
               _loc2_.x = 65;
               _loc2_.y = 150;
            }
            if(_loc1_ == 3)
            {
               _loc2_.x = 180;
               _loc2_.y = 160;
            }
            if(_loc1_ == 4)
            {
               _loc2_.x = 265;
               _loc2_.y = 120;
            }
            _loc1_++;
         }
      }
      
      private function initStar() : void
      {
         var _loc2_:DisplayObject = null;
         var _loc3_:DisplayObject = null;
         this.arrStar = new Array();
         var _loc1_:int = 0;
         while(_loc1_ < 10)
         {
            _loc2_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/xianmozhilu/juexing/an.swf");
            _loc2_.x = _loc1_ * 21 + 110;
            _loc2_.y = 290;
            addChild(_loc2_);
            _loc3_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/xianmozhilu/juexing/liang.swf");
            _loc3_.x = _loc2_.x;
            _loc3_.y = _loc2_.y;
            addChild(_loc3_);
            this.arrStar.push(_loc3_);
            _loc1_++;
         }
      }
      
      public function setXianMoTianRuiData(param1:Object) : void
      {
         this.removeItemBoxChildren();
         if(param1.rank > 1)
         {
            this.checkHuanZhuang.enabled = true;
         }
         this.btnShengJie.enabled = !param1.canGouxuan;
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < 5)
         {
            if(param1.canGouxuan)
            {
               this.arrQiXuan[_loc2_].filters = [];
            }
            else if(_loc2_ + 1 < param1.rank)
            {
               this.arrQiXuan[_loc2_].filters = [];
            }
            else
            {
               this.arrQiXuan[_loc2_].filters = Tools.blackWhiteFilter;
            }
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < 10)
         {
            if(_loc2_ < param1.star)
            {
               this.arrStar[_loc2_].visible = true;
            }
            else
            {
               this.arrStar[_loc2_].visible = false;
            }
            _loc2_++;
         }
         this.xiaohao.text = "消耗天灵：" + param1.xiaohao + "";
         this.checkHuanZhuang.selectState = Boolean(param1.gouxuan);
         this.setGoodsChangeHandler();
         this.check2.selectState = param1.check2;
         this.check3.selectState = param1.check3;
         this.check4.selectState = param1.check4;
         this.check5.selectState = param1.check5;
         this.check6.selectState = param1.check6;
         this.ft1.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_HUASHANLUNJIAN];
         this.ft2.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_DONGXIE];
         this.check2.visible = this.ft2.visible;
         this.ft3.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_XIDU];
         this.check3.visible = this.ft3.visible;
         this.ft4.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_NANDI];
         this.check4.visible = this.ft4.visible;
         this.ft5.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_BEIGAI];
         this.check5.visible = this.ft5.visible;
         this.ft6.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_ZHONGSHENTONG];
         this.check6.visible = this.ft6.visible;
         this.ft7.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN];
         this.ft8.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN8];
         this.ft9.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN9];
         this.ft10.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN10];
         this.ft11.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN11];
         this.ft12.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN12];
         this.ft12num = GameState.dictMainStatus[SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN12];
         this.ft13.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN13];
         this.ft13num = GameState.dictMainStatus[SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN13];
         this.ft14.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN14];
         this.ft15.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN15];
         this.ft15num = GameState.dictMainStatus[SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN15];
         this.ft16.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN16];
         this.ft17.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN17];
         this.ft18.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN18];
         this.ft19.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN19];
         this.ft20.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN20];
         this.ft21.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN21];
         this.ft22.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN22];
         this.ft23.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN23];
         this.ft24.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN24];
         this.kuang1.visible = this.itemFace1.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN1_SKILL];
         this.kuang2.visible = this.itemFace2.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN1_SKILL2];
         this.ft400664.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN400664];
         this.ft400665.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN400665];
         this.ft400666.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN400666];
         this.ft400667.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN400667];
         this.ft401811.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_JIUYANGHUANHUNDAN401811];
      }
      
      public function setGoodsChangeHandler() : void
      {
         this.beibao.text = "拥有天灵：" + String(GameInstance.mainCharData.goodsInfo.getGoodsNumByID(47256,true));
      }
      
      private function removeItemBoxChildren() : void
      {
         while(this.boxContainer.numChildren > 0)
         {
            this.boxContainer.removeChildAt(0);
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
               PipeManager.sendMsg(PipeConstants.UI_ZHONGZUJIEMIAN_SKILL_DRAG,this.currSkill);
            }
            this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
         }
      }
      
      private function onSkillMouseUp(param1:MouseEvent) : void
      {
         this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
      }
   }
}

