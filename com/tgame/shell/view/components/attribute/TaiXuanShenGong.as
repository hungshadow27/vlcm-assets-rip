package com.tgame.shell.view.components.attribute
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.moudels.TaiXuanShenGong.model.info.TaiXuanShenGongVO;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.*;
   import gs.TweenMax;
   
   public class TaiXuanShenGong extends Sprite
   {
      
      public static const UI_TAIXUANSHENGONG_GUANBI_CLICK:String = "UI_TAIXUANSHENGONG_GUANBI_CLICK";
      
      public var $parent:DisplayObject;
      
      public var bgImg:Bitmap;
      
      private var previousButton:FSimpleButton;
      
      private var nextButton:FSimpleButton;
      
      private var bgCanvas:FCanvas;
      
      private var fta:FTextArea;
      
      private var ftaName:FTextArea;
      
      private var lingWuBtn:SmallButton;
      
      private var fta1:FTextArea;
      
      private var fta2:FTextArea;
      
      private var fta3:FTextArea;
      
      private var fta5:FTextArea;
      
      private var fb1:FLabel;
      
      private var img:Bitmap;
      
      private var item:ItemFace;
      
      private var gongImg:DisplayObject;
      
      private var taiXuanShenGongTupoCanvas:TaiXuanShenGongTupoCanvas;
      
      public var tupoBo:Boolean = false;
      
      private var jianshuContainer:Sprite;
      
      private var p:Point;
      
      private var currSkill:ItemFace;
      
      private var fc1:FCanvas;
      
      private var fc2:FCanvas;
      
      private var isDrag:Boolean;
      
      public var bg:Bitmap;
      
      private var dqId:int;
      
      private var tf:TextFormat;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var tootips1:String = "";
      
      private var tarenBo:Boolean = true;
      
      private var gongImgObj:Object;
      
      private var bt_bit:Bitmap;
      
      private const MAX_ZHAOSHI_COUNT:int = 24;
      
      private var fts:FTextArea;
      
      private var fts1:FTextArea;
      
      private var equipContainers:Sprite;
      
      private var isMain:Boolean;
      
      private var kuangHD:Bitmap;
      
      private var kuangSpr:Sprite;
      
      private var fts2:FTextArea;
      
      private var taixuanshi:int = 0;
      
      private var fts3:FTextArea;
      
      private var checkZq:FCheckBox;
      
      private var item1:ItemFace;
      
      private var kuang1:Bitmap;
      
      public function TaiXuanShenGong()
      {
         var $mask:Sprite;
         var i:int;
         var skill:Skill;
         this.gongImgObj = {};
         super();
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
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
         this.fc1 = new FCanvas();
         this.fc1.x = 0;
         this.fc1.y = 1;
         this.fc1.width = 403;
         this.fc1.height = 366;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.fc1 = new FCanvas();
         this.fc1.x = 0 + 2;
         this.fc1.y = 1 + 2;
         this.fc1.width = 403 - 4;
         this.fc1.height = 212 + 11 - 2;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.fc1 = new FCanvas();
         this.fc1.x = 0 + 2;
         this.fc1.y = 223;
         this.fc1.width = 403 - 4;
         this.fc1.height = 142;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.bt_bit = StaticValue.getBitmapByClassName("ui.tongyong.touming1");
         this.bt_bit.x = 265;
         this.bt_bit.y = 225;
         this.bt_bit.width = 134;
         this.bt_bit.height = 138;
         addChild(this.bt_bit);
         this.previousButton = new FSimpleButton();
         this.previousButton.skin = "previousButton";
         addChild(this.previousButton);
         this.previousButton.x = 100;
         this.previousButton.y = 195 - 5;
         this.previousButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.nextButton = new FSimpleButton();
         this.nextButton.skin = "nextButton";
         addChild(this.nextButton);
         this.nextButton.x = 260;
         this.nextButton.y = 195 - 5;
         this.nextButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 220 + 55;
            y = 210 + 25;
            textColor = 1309028;
            htmlText = LanResManager.getLanCommonTextWords("属性加成：");
         }
         addChild(this.fta);
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.ftaName = new FTextArea();
         with(this.ftaName)
         {
            filters = StaticValue.filter;
            x = 115;
            y = 195 - 5;
            defaultTextFormat = tf;
            textColor = StaticValue.WHITE;
            width = 150;
            height = 18;
         }
         addChild(this.ftaName);
         this.lingWuBtn = new SmallButton();
         this.lingWuBtn.label = LanResManager.getLanCommonTextWords("领悟本式");
         addChild(this.lingWuBtn);
         this.lingWuBtn.x = 335 - 23;
         this.lingWuBtn.y = 195 - 1 - 5;
         this.lingWuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fta1 = new FTextArea();
         with(this.fta1)
         {
            filters = StaticValue.filter;
            x = 220 + 55;
            y = 225 + 35;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "";
         }
         addChild(this.fta1);
         this.fta5 = new FTextArea();
         with(this.fta5)
         {
            filters = StaticValue.filter;
            x = 305;
            y = 225 + 35;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.SKY_BLUE;
            htmlText = "";
         }
         addChild(this.fta5);
         this.fta2 = new FTextArea();
         with(this.fta2)
         {
            filters = StaticValue.filter;
            x = 5;
            y = 225;
            width = 190 + 70;
            height = 230;
            wordWrap = true;
         }
         addChild(this.fta2);
         this.jianshuContainer = new Sprite();
         addChild(this.jianshuContainer);
         with(this.jianshuContainer)
         {
            x = 10;
            y = 322;
         }
         this.jianshuContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         this.jianshuContainer.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         this.taiXuanShenGongTupoCanvas = new TaiXuanShenGongTupoCanvas();
         addChild(this.taiXuanShenGongTupoCanvas);
         this.taiXuanShenGongTupoCanvas._parent2 = this;
         this.taiXuanShenGongTupoCanvas.x = 138;
         this.taiXuanShenGongTupoCanvas.y = -10;
         $mask = new Sprite();
         $mask.mouseEnabled = false;
         addChild($mask);
         $mask.x = 410;
         $mask.y = -10;
         with($mask.graphics)
         {
            beginFill(16711680,0.5);
            drawRect(0,0,500,390);
            endFill();
         }
         this.taiXuanShenGongTupoCanvas.mask = $mask;
         addEventListener(UI_TAIXUANSHENGONG_GUANBI_CLICK,this.aa1);
         this.fts = new FTextArea();
         this.fts.x = 20;
         this.fts.y = 10;
         this.fts.width = 170;
         this.fts.height = 20;
         addChild(this.fts);
         ToolTips.createToolTips(this.fts,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击2888888、防御 2288888、血量388888888、暴击888、闪避888") + " <br>" + LanResManager.getLanCommonTextWords("太玄护体顶级神功：有10%的几率触发三倍朱雀反弹伤害效果！") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts1 = new FTextArea();
         this.fts1.x = 250 + 10;
         this.fts1.y = 10;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 170;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("太玄宗师心法（已激活）");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击8888888  防御5888888  血量12888888  武功提升八层") + "<br>" + LanResManager.getLanCommonTextWords("特殊技能：每次攻击都有50%的几率触发，触发后每次攻击对手都能额外多造成18亿血量的伤害，") + "<br>" + LanResManager.getLanCommonTextWords("持续效果1分钟，冷却100秒。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.kuangSpr = new Sprite();
         this.equipContainers = new Sprite();
         this.equipContainers.x = 295 - 288;
         this.equipContainers.y = 322 - 73 + 1 - 40 - 24 - 7;
         with(this.equipContainers.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,40,40);
            endFill();
         }
         this.equipContainers.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick,false,30);
         this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.kuangSpr.addChild(this.kuangHD);
         this.kuangHD.x = 10;
         this.kuangHD.y = 266 - 2 - 1 - 10 - 40 - 24 - 7;
         i = 0;
         while(i < 3)
         {
            this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
            this.kuangSpr.addChild(this.kuangHD);
            this.kuangHD.x = 10 + 40 * i;
            this.kuangHD.y = 266 - 2 - 1 - 10 - 40 - 24 - 7 - 40;
            i++;
         }
         this.fts2 = new FTextArea();
         this.fts2.x = 20;
         this.fts2.y = 10 + 20;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 170;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("太玄内功心法（已激活）");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("提升属性：攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 240000层") + "<br>" + LanResManager.getLanCommonTextWords("养成属性：可使用太玄石为太玄内功心法进行养成属性，每次可增加攻击200亿，防御100亿，所有武功提升10000层！（最多可养成500次！）！") + "<br>" + LanResManager.getLanCommonTextWords("当前已加成") + taixuanshi + LanResManager.getLanCommonTextWords("次") + "<br>" + LanResManager.getLanCommonTextWords("攻击") + taixuanshi * 200 + LanResManager.getLanCommonTextWords("亿，防御") + taixuanshi * 100 + LanResManager.getLanCommonTextWords("亿，所有武功提升") + taixuanshi * 10000 + LanResManager.getLanCommonTextWords("层") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts3 = new FTextArea();
         this.fts3.x = 20;
         this.fts3.y = 10 + 20 + 20;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 170;
         this.fts3.height = 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("睚眦（上古神兽）");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击128888亿防御108888亿血量138888亿暴击 88888闪避 88888所有武功2500000层") + "<br>" + LanResManager.getLanCommonTextWords("睚眦：古代汉族神话传说中龙的第二个儿子，龙头豺身，性格刚烈，好勇擅斗，嗜杀好斗。 人物可自己驾驭。") + "<br>" + LanResManager.getLanCommonTextWords("睚眦灭世：攻击时100%触发睚眦灭世，持续10秒；在此状态下，范围5格内的所有对手，只要骑乘坐骑都将瞬") + "<br>" + LanResManager.getLanCommonTextWords("间被打飞；且只要自身受到攻击都将瞬间反噬对手一灭世兽印，持续10秒；对手在咒印下，将受到咒印的压制") + "<br>" + LanResManager.getLanCommonTextWords("无法做出任何操作；睚眦灭世 万敌震退，自身在睚眦灭世的状态下，受到的所有伤害将只有一点。冷却60秒。");
            return _loc1_ + "</textformat>";
         });
         this.checkZq = new FCheckBox();
         addChild(this.checkZq);
         this.checkZq.visible = false;
         this.checkZq.x = 20 + 80 + 15 + 60;
         this.checkZq.y = 50;
         this.checkZq.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         skill = new Skill(80200303);
         skill.isLearn = 1;
         this.kuang1 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.kuang1.x = 350;
         this.kuang1.y = -177;
         this.jianshuContainer.addChild(this.kuang1);
         this.item1 = new ItemFace(skill);
         this.item1.x = 352;
         this.item1.y = -175;
         this.item1.showKungFuTag();
         this.item1.setShowCount(false);
         this.jianshuContainer.addChild(this.item1);
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.checkZq:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkZq.selectState,94]));
         }
      }
      
      private function showTip1(param1:String) : void
      {
         this.tip.htmlText = param1;
         Tools.currentStage.addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = Tools.currentStage.mouseX + 15;
         this.tipCanvas.y = Tools.currentStage.mouseY + 25;
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         this.jianshuContainer.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         this.p = new Point(mouseX,mouseY);
         this.currSkill = param1.target as ItemFace;
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         if(this.currSkill != param1.target)
         {
            this.jianshuContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DINGCHANJUE_SKILL_DRAG,"",this.currSkill));
            this.jianshuContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         }
      }
      
      private function onMouseUp(param1:MouseEvent) : void
      {
         this.jianshuContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
      }
      
      private function aa1(param1:BaseEvent) : void
      {
         this.onShowLv(false);
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this.$parent = param1;
         this.taiXuanShenGongTupoCanvas._parent2 = param1;
         this.taiXuanShenGongTupoCanvas._parent3 = this;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.previousButton:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_TAIXUANSHENGONG_SHANGYIYE_CLICK));
               break;
            case this.nextButton:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_TAIXUANSHENGONG_XIAYIYE_CLICK));
               break;
            case this.lingWuBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.TAIXUANSHENGONG_LINGWU_SHOW));
               this.onShowLv(true);
         }
      }
      
      public function setInitialize(param1:Boolean, param2:TaiXuanShenGongVO) : void
      {
         this.isMain = param1;
         this.setMainInitialize(param2.hp,param2.mp,param2.cp,param2.act,param2.def);
         this.setBowPage(param2.nowID,param2.nowLookingID);
         var _loc3_:String = param2.getSkillAddStr();
         this.setWuXueJiaCheng(_loc3_);
         this.fta2.htmlText = "<textformat leading=\'4\'><font color=\'#e66a26\'>" + param2.miaoshu + "</font></textformat>";
         this.ftaName.htmlText = param2.nowLookingName;
         this.setJihuo(param2.dingJi,param1);
         this.checkZq.selectState = param2.isZuoQi;
      }
      
      public function setJihuo(param1:Boolean, param2:Boolean) : void
      {
         if(param1)
         {
            this.fts.textColor = StaticValue.GREEN;
            this.fts.htmlText = LanResManager.getLanCommonTextWords("太玄顶级属性(已激活)");
         }
         else
         {
            this.fts.textColor = StaticValue.RED;
            this.fts.htmlText = LanResManager.getLanCommonTextWords("太玄顶级属性(未激活)");
         }
         if(param2)
         {
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.TAIXUANSHENGONG_ZHONGSHIXINFA_ID];
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.TAIXUANSHENGONG_NEIGONG_ID];
            this.taixuanshi = GameState.dictMainStatus[SpecialGoodsID.TAIXUANSHENGONG_TAIXUANSHI_ID];
            this.fts3.visible = GameState.dictMainStatus[SpecialGoodsID.TAIXUANSHENGONG_YAZI_ID];
            this.checkZq.visible = GameState.dictMainStatus[SpecialGoodsID.TAIXUANSHENGONG_YAZI_ID];
            this.item1.visible = this.kuang1.visible = GameState.dictMainStatus[730603];
         }
         else
         {
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.TAIXUANSHENGONG_ZHONGSHIXINFA_ID];
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.TAIXUANSHENGONG_NEIGONG_ID];
            this.taixuanshi = GameState.dictTargetStatus[SpecialGoodsID.TAIXUANSHENGONG_TAIXUANSHI_ID];
            this.fts3.visible = GameState.dictTargetStatus[SpecialGoodsID.TAIXUANSHENGONG_YAZI_ID];
            this.checkZq.visible = GameState.dictTargetStatus[SpecialGoodsID.TAIXUANSHENGONG_YAZI_ID];
            this.item1.visible = this.kuang1.visible = GameState.dictTargetStatus[730603];
         }
      }
      
      private function setWuXueJiaCheng(param1:String) : void
      {
         var _loc2_:Array = param1.split(";");
         var _loc3_:String = "<textformat leading=\'6\'>";
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.length)
         {
            _loc3_ += _loc2_[_loc4_] + "<br>";
            _loc4_++;
         }
         _loc3_ += "</textformat>";
         this.fta5.htmlText = _loc3_;
      }
      
      private function setMainInitialize(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         var _loc6_:String = "";
         _loc6_ = _loc6_ + ("<textformat leading=\'6\'><font color=\'" + StaticValue.SKY_BLUE_HTML + "\'>");
         _loc6_ = _loc6_ + (LanResManager.getLanCommonTextWords("攻击：+") + param4 + "<br>" + LanResManager.getLanCommonTextWords("防御：+") + param5 + "<br>" + LanResManager.getLanCommonTextWords("生命：+") + param1 + "<br>" + LanResManager.getLanCommonTextWords("内力：+") + param2 + "<br>" + LanResManager.getLanCommonTextWords("体力：+") + param3 + "<br>");
         _loc6_ = _loc6_ + "</font>";
         _loc6_ = _loc6_ + "</textformat>";
         this.fta1.htmlText = _loc6_;
      }
      
      private function setSkill(param1:Skill, param2:Boolean) : void
      {
         if(this.item != null && this.item.parent != null)
         {
            this.item.parent.removeChild(this.item);
         }
         this.item = new ItemFace(param1);
         this.item.setShowCount(false);
         this.jianshuContainer.addChild(this.item);
         if(param2)
         {
            this.item.filters = [];
         }
         else
         {
            this.item.filters = Tools.blackWhiteFilter;
         }
      }
      
      private function setBowPage(param1:int, param2:int) : void
      {
         this.dqId = param2;
         if(this.gongImg != null && this.gongImg.parent != null)
         {
            removeChild(this.gongImg);
         }
         if(this.tarenBo)
         {
            if(param2 == 0)
            {
               if(this.gongImgObj[1] != null)
               {
                  this.gongImg = this.gongImgObj[1];
               }
               else
               {
                  this.gongImg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/taixuanshengong/" + 1 + ".jpg",400,223);
                  this.gongImgObj[1] = this.gongImg;
               }
            }
            else if(this.gongImgObj[param2] != null)
            {
               this.gongImg = this.gongImgObj[param2];
            }
            else
            {
               this.gongImg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/taixuanshengong/" + param2 + ".jpg",400,223);
               this.gongImgObj[param2] = this.gongImg;
            }
         }
         else if(param1 == 0)
         {
            if(this.gongImgObj[1] != null)
            {
               this.gongImg = this.gongImgObj[1];
            }
            else
            {
               this.gongImg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/taixuanshengong/" + 1 + ".jpg",400,223);
               this.gongImgObj[1] = this.gongImg;
            }
         }
         else if(this.gongImgObj[param1] != null)
         {
            this.gongImg = this.gongImgObj[param1];
         }
         else
         {
            this.gongImg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/taixuanshengong/" + param1 + ".jpg",400,223);
            this.gongImgObj[param1] = this.gongImg;
         }
         if(param2 == 1)
         {
            this.previousButton.enabled = false;
         }
         else
         {
            this.previousButton.enabled = true;
         }
         if(param2 == this.MAX_ZHAOSHI_COUNT)
         {
            this.nextButton.enabled = false;
         }
         else
         {
            this.nextButton.enabled = true;
         }
         param2--;
         if(param1 > param2 && param2 >= 0)
         {
            this.lingWuBtn.label = LanResManager.getLanCommonTextWords("已领悟");
            this.lingWuBtn.enabled = false;
         }
         else if(param1 == param2)
         {
            this.lingWuBtn.label = LanResManager.getLanCommonTextWords("开始领悟");
            this.lingWuBtn.enabled = true;
         }
         else
         {
            this.lingWuBtn.label = LanResManager.getLanCommonTextWords("未领悟");
            this.lingWuBtn.enabled = false;
         }
         this.gongImg.x = 198 - this.gongImg.width / 2 + 5;
         this.gongImg.y = 106 - this.gongImg.height / 2 + 5 + 5;
         addChildAt(this.gongImg,0);
      }
      
      public function onShowLv(param1:Boolean) : void
      {
         var bo:Boolean = param1;
         if(bo)
         {
            if(this.taiXuanShenGongTupoCanvas.x == 138)
            {
               TweenMax.to(this.taiXuanShenGongTupoCanvas,1,{"x":410});
               this.tupoBo = true;
            }
            this.lingWuBtn.enabled = false;
            this.previousButton.enabled = false;
            this.nextButton.enabled = false;
         }
         else
         {
            if(this.taiXuanShenGongTupoCanvas.x == 410)
            {
               TweenMax.to(this.taiXuanShenGongTupoCanvas,1,{
                  "x":138,
                  "onComplete":function():void
                  {
                     lingWuBtn.enabled = true;
                  }
               });
               this.tupoBo = false;
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_TAIXUANSHENGONG_ZIDONGTISHENG_CLICKJ,"",false));
            }
            this.taiXuanShenGongTupoCanvas.check.selectState = false;
            this.taiXuanShenGongTupoCanvas.check.enabled = true;
            this.taiXuanShenGongTupoCanvas.zdlwBtn.enabled = true;
            if(this.dqId == 1)
            {
               this.previousButton.enabled = false;
            }
            else
            {
               this.previousButton.enabled = true;
            }
            if(this.dqId == this.MAX_ZHAOSHI_COUNT)
            {
               this.nextButton.enabled = false;
            }
            else
            {
               this.nextButton.enabled = true;
            }
         }
      }
      
      public function isTaiXuanShenGongtupoCanvasShow() : Boolean
      {
         if(this.taiXuanShenGongTupoCanvas.x == 410)
         {
            return true;
         }
         return false;
      }
      
      public function setTaiXuanShenGongLingwuInitialize(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int, param7:String) : void
      {
         this.taiXuanShenGongTupoCanvas.setInitialize(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setTaiXuanShenGongLingwuZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.taiXuanShenGongTupoCanvas.setZhufuzhi(param1,param2,param3);
      }
      
      public function setTaiXuanShenGongLingwuJiyuanzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.taiXuanShenGongTupoCanvas.setJiyuanzhi(param1,param2,param3);
      }
      
      public function setTaiXuanShenGongLingwuGoods(param1:Goods, param2:Boolean) : void
      {
         this.taiXuanShenGongTupoCanvas.setGoods(param1,param2);
      }
      
      public function setTaiXuanShenGongLingwuBtn(param1:Boolean) : void
      {
         this.taiXuanShenGongTupoCanvas.setBtn(param1);
      }
      
      public function setTaiXuanShenGongEnabledFun() : void
      {
         this.lingWuBtn.enabled = this.lingWuBtn.visible = false;
         this.previousButton.enabled = this.previousButton.visible = false;
         this.nextButton.enabled = this.nextButton.visible = false;
         this.tarenBo = false;
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         if(this.isMain)
         {
            this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      public function set_TaiXuanShenGong(param1:Array) : void
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
            if(_loc3_.res.position == ItemPositionRange.POSTION_TAIXUANSHENGONG_QINGMULINGQUAN)
            {
               _loc4_.x = 4 + 1;
               _loc4_.y = 4 + 1;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_TAIXUANSHENGONG_DUGUQIUBAI)
            {
               _loc4_.x = 4 + 1;
               _loc4_.y = 4 + 1 - 40;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_TAIXUANSHENGONG_FENGQINGYANG)
            {
               _loc4_.x = 4 + 1 + 40;
               _loc4_.y = 4 + 1 - 40;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_TAIXUANSHENGONG_LINGHUCHONG)
            {
               _loc4_.x = 4 + 1 + 80;
               _loc4_.y = 4 + 1 - 40;
               this.equipContainers.addChild(_loc4_);
            }
            _loc2_++;
         }
      }
   }
}

