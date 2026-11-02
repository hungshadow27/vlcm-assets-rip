package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.*;
   import gs.TweenMax;
   
   public class Jiuyinzhenjing extends Sprite
   {
      
      public static const UI_JIUYINZHENJING_GUANBI_CLICKJ:String = "UI_JIUYINZHENJING_GUANBI_CLICKJ";
      
      private var fta2:FTextArea;
      
      private var fta3:FTextArea;
      
      private var fta4:FTextArea;
      
      private var fta5:FTextArea;
      
      private var fta6:FTextArea;
      
      private var djtpBtn:SecondButton;
      
      public var _parent:DisplayObject;
      
      private var listContainer:Sprite;
      
      private var giftList:FList;
      
      private var Scroll:FVScorllBar;
      
      private var shuxingFta1:FTextArea;
      
      private var shuxingFta2:FTextArea;
      
      private var djtpBtnBo:Boolean = true;
      
      private var jiuyinzhenjingtupoCanvas:JiuyinzhenjingTupoCanvas;
      
      private var buffSpr:Sprite;
      
      private var container:Sprite;
      
      private var zuox:int = 210;
      
      private var youx:int = 190;
      
      private var fc1:FCanvas;
      
      private var fc2:FCanvas;
      
      private var fc3:FCanvas;
      
      private var yanhuaMc:MovieClip;
      
      private var bt:Bitmap;
      
      private var miaoshu:FTextArea;
      
      private var miaoshu2:FTextArea;
      
      private var line:Bitmap;
      
      private var pointIco0:Bitmap;
      
      private var pointIco1:Bitmap;
      
      private var pointIco2:Bitmap;
      
      private var pointIco3:Bitmap;
      
      private var pointIco4:Bitmap;
      
      private var pointIco5:Bitmap;
      
      private var pointIco6:Bitmap;
      
      private var pointIco7:Bitmap;
      
      private var pointIco8:Bitmap;
      
      public var tupoBo:Boolean;
      
      private var dangqianId:int;
      
      private var fts1:FTextArea;
      
      private var fts2:FTextArea;
      
      private var fts3:FTextArea;
      
      private var fts4:FTextArea;
      
      private var mainSkillContainer:Sprite;
      
      private var currSkill:ItemFace;
      
      private var p:Point;
      
      private var mainSkillItemFace:ItemFace;
      
      private var mainSkill:Skill;
      
      private var kuang1:Bitmap;
      
      private var fts5:FTextArea;
      
      private var checkHz:FCheckBox;
      
      private var equipContainers:Sprite;
      
      private var isMain:Boolean;
      
      private var kuangHD:Bitmap;
      
      private var kuangSpr:Sprite;
      
      private var fts6:FTextArea;
      
      private var suipian:int = 0;
      
      private var zhenyuan:FTextArea;
      
      private var zhenyuannum:int;
      
      public function Jiuyinzhenjing()
      {
         var $mask:Sprite;
         super();
         this.fc1 = new FCanvas();
         this.fc1.x = 0;
         this.fc1.y = 1;
         this.fc1.width = 405;
         this.fc1.height = 195 + 170;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.fc2 = new FCanvas();
         this.fc2.x = 1;
         this.fc2.y = 111;
         this.fc2.width = 402;
         this.fc2.height = 55;
         this.fc2.skin = "box";
         addChild(this.fc2);
         this.fc3 = new FCanvas();
         this.fc3.x = 1;
         this.fc3.y = 165;
         this.fc3.width = 402;
         this.fc3.height = 199;
         this.fc3.skin = "box_transparence";
         addChild(this.fc3);
         this.bt = StaticValue.getBitmapByClassName("ui.jiuyinzhenjing.bg");
         addChild(this.bt);
         this.bt.x = 3;
         this.bt.y = 2;
         this.container = new Sprite();
         addChild(this.container);
         this.container.x = 0;
         this.container.y = 0;
         this.line = StaticValue.getBitmapByClassName("ui.line");
         addChild(this.line);
         this.line.width = 195;
         this.line.x = 199;
         this.line.y = 305;
         this.miaoshu = new FTextArea();
         with(this.miaoshu)
         {
            filters = StaticValue.filter;
            x = 4;
            y = 114;
            textColor = StaticValue.WHITE;
            width = 382;
            wordWrap = true;
            htmlText = "";
         }
         addChild(this.miaoshu);
         this.fta2 = new FTextArea();
         with(this.fta2)
         {
            filters = StaticValue.filter;
            x = 200;
            y = 180;
            textColor = StaticValue.ORANGE;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = LanResManager.getLanCommonTextWords("悟通本式加成如下属性：");
         }
         addChild(this.fta2);
         this.fta3 = new FTextArea();
         with(this.fta3)
         {
            filters = StaticValue.filter;
            x = 200;
            y = 210;
            textColor = StaticValue.SKY_BLUE;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = LanResManager.getLanTextWords(this,"攻击：生命：体力：");
         }
         addChild(this.fta3);
         this.shuxingFta1 = new FTextArea();
         with(this.shuxingFta1)
         {
            filters = StaticValue.filter;
            x = 247;
            y = 210;
            textColor = StaticValue.SKY_BLUE;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "";
         }
         addChild(this.shuxingFta1);
         this.fta4 = new FTextArea();
         with(this.fta4)
         {
            filters = StaticValue.filter;
            x = 293;
            y = 210;
            textColor = StaticValue.SKY_BLUE;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = LanResManager.getLanTextWords(this,"防御：内力：");
         }
         addChild(this.fta4);
         this.shuxingFta2 = new FTextArea();
         with(this.shuxingFta2)
         {
            filters = StaticValue.filter;
            x = 348;
            y = 210;
            textColor = StaticValue.SKY_BLUE;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "";
         }
         addChild(this.shuxingFta2);
         this.djtpBtn = new SecondButton();
         this.djtpBtn.label = LanResManager.getLanCommonTextWords("领悟本式");
         addChild(this.djtpBtn);
         this.djtpBtn.x = 280;
         this.djtpBtn.y = 280;
         this.djtpBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
         this.miaoshu2 = new FTextArea();
         with(this.miaoshu2)
         {
            filters = StaticValue.filter;
            x = 200;
            y = 312 - 3;
            textColor = StaticValue.ORANGE;
            width = 141;
            wordWrap = true;
            htmlText = "";
         }
         addChild(this.miaoshu2);
         this.buffSpr = new Sprite();
         this.buffSpr.x = 350;
         this.buffSpr.y = 318;
         addChild(this.buffSpr);
         this.fta6 = new FTextArea();
         with(this.fta6)
         {
            filters = StaticValue.filter;
            x = 20;
            y = 92;
            textColor = StaticValue.WHITE;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = LanResManager.getLanCommonTextWords("九阴真经");
         }
         addChild(this.fta6);
         this.listContainer = new Sprite();
         addChild(this.listContainer);
         with(this.listContainer)
         {
            x = 4;
            y = 168;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,174,196);
            graphics.endFill();
         }
         this.giftList = new FList();
         this.giftList.skin = "list";
         this.giftList.itemRenderer = new JiuyinzhenjingList();
         this.giftList.listWidth = 174;
         this.listContainer.addChild(this.giftList);
         this.giftList.x = 0;
         this.giftList.y = 0;
         this.giftList.addEventListener(MouseEvent.CLICK,this.onListClick);
         this.Scroll = new FVScorllBar(this.listContainer,194);
         addChild(this.Scroll);
         this.Scroll.x = 180;
         this.Scroll.y = 168;
         this.jiuyinzhenjingtupoCanvas = new JiuyinzhenjingTupoCanvas();
         addChild(this.jiuyinzhenjingtupoCanvas);
         this.jiuyinzhenjingtupoCanvas.x = 142;
         this.jiuyinzhenjingtupoCanvas.y = -4;
         $mask = new Sprite();
         $mask.mouseEnabled = false;
         addChild($mask);
         $mask.x = 414;
         $mask.y = -4;
         with($mask.graphics)
         {
            beginFill(16711680,0.5);
            drawRect(0,0,280,390);
            endFill();
         }
         this.jiuyinzhenjingtupoCanvas.mask = $mask;
         addEventListener(UI_JIUYINZHENJING_GUANBI_CLICKJ,this.aa1);
         this.fts1 = new FTextArea();
         this.fts1.x = 10;
         this.fts1.y = 10;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 170;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("九阴无上神功秘典（已激活）");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击10888888 防御98888888 血量28888888 暴击888 闪避888 所有武功提升60层") + "<br>" + LanResManager.getLanCommonTextWords("  额外提升人物攻击、防御、闪避、暴击、血量属性各20%") + "<br>" + LanResManager.getLanCommonTextWords("九阴宗师（特殊技能）：此技能由黄裳亲传指点，激活九阴无上神功秘典后即可生") + "<br>" + LanResManager.getLanCommonTextWords("  效，将大大提高九阴神爪的触发几率，并大大增强九阴神爪所造成的伤害效果！") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 10;
         this.fts2.y = 25;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 200;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("九阴真经究极激活秘籍（已激活）");
         this.fts2.visible = true;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击2088888888 防御1688888888 暴击2888 闪避2888血量2088888888、所有武功提升2180层") + "<br>";
            return _loc1_ + "</font></textformat>";
         });
         this.fts3 = new FTextArea();
         this.fts3.x = 10;
         this.fts3.y = 25 + 15;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 200;
         this.fts3.height = 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("九阴阴煞心法秘籍（已激活）");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击1500亿、防御1000亿、血量3000亿、暴击18888、闪避18888、所有武功提升20000层") + "<br>" + LanResManager.getLanCommonTextWords("特殊效果：额外提升人物攻击、防御、血量、暴击、闪避各500%") + "<br>";
            return _loc1_ + "</font></textformat>";
         });
         this.fts4 = new FTextArea();
         this.fts4.x = 20 + 208;
         this.fts4.y = 20;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 170;
         this.fts4.height = 20;
         this.fts4.htmlText = LanResManager.getLanCommonTextWords("紫府洞天秘籍(已激活)");
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("紫府洞天（特殊技能）：使用该技能，必定将对手封印在自身武器之中，持续15秒。对手在封印状") + "<br>" + LanResManager.getLanCommonTextWords("态下，人物角色将消失不见，且每秒掉当前血30%，无敌于天下，冷却30秒！") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.kuang1 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang1);
         this.kuang1.x = 25 + 324;
         this.kuang1.y = 160 + 35 - 186;
         this.mainSkillContainer = new Sprite();
         this.mainSkillContainer.x = 25 + 2 + 324;
         this.mainSkillContainer.y = 160 + 2 + 35 - 186;
         addChild(this.mainSkillContainer);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onSkillMouseDown);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_UP,this.onSkillMouseUp);
         this.fts5 = new FTextArea();
         this.fts5.x = 10 + 255 + 40 - 96;
         this.fts5.y = 7 + 20 + 105 + 90 + 51;
         this.fts5.textColor = StaticValue.GREEN;
         this.fts5.width = 110;
         this.fts5.height = 20;
         this.fts5.htmlText = LanResManager.getLanCommonTextWords("时尚套装");
         this.fts5.visible = false;
         addChild(this.fts5);
         this.checkHz = new FCheckBox();
         addChild(this.checkHz);
         this.checkHz.x = 256 + 117 - 96;
         this.checkHz.y = 7 + 20 + 105 + 90 + 51;
         this.checkHz.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.kuangSpr = new Sprite();
         this.equipContainers = new Sprite();
         this.equipContainers.x = 295 - 288 + 345;
         this.equipContainers.y = 322 - 73 + 1 - 40 - 45 + 30 + 39;
         with(this.equipContainers.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,40,40);
            endFill();
         }
         this.equipContainers.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick,false,30);
         this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.kuangSpr.addChild(this.kuangHD);
         this.kuangHD.x = 10 + 345;
         this.kuangHD.y = 266 - 2 - 1 - 10 - 40 - 45 + 30 + 39;
         this.fts6 = new FTextArea();
         this.fts6.x = 10;
         this.fts6.y = 60;
         this.fts6.textColor = StaticValue.GREEN;
         this.fts6.width = 170 + 20;
         this.fts6.height = 20;
         this.fts6.htmlText = LanResManager.getLanCommonTextWords("死神复制秘籍（已激活）");
         this.fts6.visible = false;
         addChild(this.fts6);
         ToolTips.createToolTips(this.fts6,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("死神复制秘籍：攻击12888888889000 防御10888888889000 血量13888888889000") + "<br>" + LanResManager.getLanCommonTextWords("暴击 88888闪避88888   所有武功2500000层") + "<br>" + LanResManager.getLanCommonTextWords("死神复制——掌管于生死邪灵，不断吸收活人精气为食。攻击时100%触发死神复制，") + "<br>" + LanResManager.getLanCommonTextWords("持续10秒；对手在此状态下，全身精气将被吸光，且对手将变身成死神侍从，人物往") + "<br>" + LanResManager.getLanCommonTextWords("哪个方向移动，变成侍从的对手都将紧随其后，当状态解除后，对手将陷入黑暗沉睡，") + "<br>" + LanResManager.getLanCommonTextWords("持续120秒。冷却60秒。") + "<br>" + LanResManager.getLanCommonTextWords("死神复制属性：激活死神复制后，将开启死神复制隐藏属性，可使用侍从碎片对该隐") + "<br>" + LanResManager.getLanCommonTextWords("藏属性进行养成，最多可养成200次。每个增加：攻击1500亿，所有武功350000层。") + "<br>" + LanResManager.getLanCommonTextWords("当前已使用") + suipian + LanResManager.getLanCommonTextWords("颗侍从碎片") + "<br>" + LanResManager.getLanCommonTextWords("增加攻击") + suipian * 1500 + LanResManager.getLanCommonTextWords("亿，所有武功") + suipian * 350000 + LanResManager
            .getLanCommonTextWords("层") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.zhenyuan = new FTextArea();
         this.zhenyuan.x = 10;
         this.zhenyuan.y = 7;
         this.zhenyuan.textColor = StaticValue.RED;
         this.zhenyuan.width = 170;
         this.zhenyuan.height = 20;
         this.zhenyuan.htmlText = LanResManager.getLanCommonTextWords("九阴真经真元（已激活）");
         addChild(this.zhenyuan);
         ToolTips.createToolTips(this.zhenyuan,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("已使用") + zhenyuannum + LanResManager.getLanCommonTextWords("个") + "<br>" + LanResManager.getLanCommonTextWords("每使用一个增加攻击+1.000.000防守+1.000.000武功层+1") + "<br>";
            return _loc1_ + "</font></textformat>";
         });
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkHz.selectState,20]));
      }
      
      private function aa1(param1:BaseEvent) : void
      {
         this.onShowLv(false);
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
         this.jiuyinzhenjingtupoCanvas._parent = param1;
         this.jiuyinzhenjingtupoCanvas._parent2 = this;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.djtpBtn:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_JIUYINZHENJING_DENGJITUPO_CLICKJ,"",this.giftList.selectItem.id));
         }
      }
      
      private function onListClick(param1:MouseEvent) : void
      {
         if(this.giftList.selectItem == null)
         {
            return;
         }
         var _loc2_:String = "";
         var _loc3_:String = "";
         var _loc4_:int = 0;
         while(_loc4_ < this.giftList.selectItem.shuxing.length)
         {
            if((_loc4_ + 1) % 2 == 0 && _loc4_ != 0)
            {
               _loc2_ += this.giftList.selectItem.shuxing[_loc4_] + "<br>";
            }
            else
            {
               _loc3_ += this.giftList.selectItem.shuxing[_loc4_] + "<br>";
            }
            _loc4_++;
         }
         this.shuxingFta1.htmlText = _loc3_;
         this.shuxingFta2.htmlText = _loc2_;
         this.miaoshu.htmlText = this.giftList.selectItem.miaoshu;
         if(this.djtpBtnBo)
         {
            if(this.dangqianId + 1 == this.giftList.selectItem.id)
            {
               if(this.giftList.selectItem.lingwu)
               {
                  this.djtpBtn.enabled = false;
               }
               else
               {
                  this.djtpBtn.enabled = true;
               }
            }
            else
            {
               this.djtpBtn.enabled = false;
            }
         }
         if(this.giftList.selectItem.dangqian)
         {
            this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_JIUYINZHENJING_DENGJITUPO_CLICKJ,"",this.giftList.selectItem.id));
         }
         else
         {
            this.onShowLv(false);
         }
      }
      
      public function setInitialize(param1:Boolean, param2:Array) : void
      {
         var _loc7_:int = 0;
         this.giftList.dataProvider = param2;
         this.Scroll.update();
         this.shuxingFta1.htmlText = "";
         this.shuxingFta2.htmlText = "";
         this.miaoshu.htmlText = "";
         this.djtpBtn.enabled = true;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:String = "";
         var _loc6_:String = "";
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         while(_loc9_ < param2.length)
         {
            if(param2[_loc9_].dangqian)
            {
               _loc8_ = _loc9_;
               _loc5_ = "";
               _loc6_ = "";
               _loc7_ = 0;
               while(_loc7_ < param2[_loc9_].shuxing.length)
               {
                  if((_loc7_ + 1) % 2 == 0 && _loc7_ != 0)
                  {
                     _loc5_ += param2[_loc9_].shuxing[_loc7_] + "<br>";
                  }
                  else
                  {
                     _loc6_ += param2[_loc9_].shuxing[_loc7_] + "<br>";
                  }
                  _loc7_++;
               }
               this.shuxingFta1.htmlText = _loc6_;
               this.shuxingFta2.htmlText = _loc5_;
               this.miaoshu.htmlText = param2[_loc9_].miaoshu;
            }
            if(param2[_loc9_].lingwu)
            {
               _loc3_++;
            }
            else
            {
               _loc4_++;
            }
            _loc9_++;
         }
         if(_loc3_ == 9)
         {
            _loc5_ = "";
            _loc6_ = "";
            _loc7_ = 0;
            while(_loc7_ < param2[param2.length - 1].shuxing.length)
            {
               if((_loc7_ + 1) % 2 == 0 && _loc7_ != 0)
               {
                  _loc5_ += param2[param2.length - 1].shuxing[_loc7_] + "<br>";
               }
               else
               {
                  _loc6_ += param2[param2.length - 1].shuxing[_loc7_] + "<br>";
               }
               _loc7_++;
            }
            this.shuxingFta1.htmlText = _loc6_;
            this.shuxingFta2.htmlText = _loc5_;
            this.miaoshu.htmlText = param2[param2.length - 1].miaoshu;
            _loc8_ = param2.length - 1;
            this.djtpBtn.enabled = false;
         }
         else if(_loc4_ == 9)
         {
            _loc5_ = "";
            _loc6_ = "";
            _loc7_ = 0;
            while(_loc7_ < param2[0].shuxing.length)
            {
               if((_loc7_ + 1) % 2 == 0 && _loc7_ != 0)
               {
                  _loc5_ += param2[0].shuxing[_loc7_] + "<br>";
               }
               else
               {
                  _loc6_ += param2[0].shuxing[_loc7_] + "<br>";
               }
               _loc7_++;
            }
            this.shuxingFta1.htmlText = _loc6_;
            this.shuxingFta2.htmlText = _loc5_;
            this.miaoshu.htmlText = param2[0].miaoshu;
            _loc8_ = 0;
         }
         this.giftList.setSelectItemByIndex(_loc8_);
         this.Scroll.setScrollPosition(80 * _loc8_);
         this.setJiHuo(param1);
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.JIUYINZHENJING_WUSHANGSHENGONG_ID];
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.JIUYINZHENJING_JIUJI_ID];
            this.fts3.visible = GameState.dictMainStatus[SpecialGoodsID.JIUYIN_YINSHA_ID];
            this.fts4.visible = GameState.dictMainStatus[SpecialGoodsID.QINNADIANXUESHOU_DIZI_ZIFUDONGTIAN_ID];
            if(GameState.dictMainStatus[SpecialGoodsID.QINNADIANXUESHOU_DIZI_ZIFUDONGTIAN_ID])
            {
               this.setSkillJiHuo(OtherConst.ZIFUDONGTIAN_SKILL_ID,true);
               this.mainSkillContainer.visible = true;
               this.kuang1.visible = true;
            }
            else
            {
               this.mainSkillContainer.visible = false;
               this.kuang1.visible = false;
            }
            if(GameState.dictMainStatus[SpecialGoodsID.JIUYINZHENJING_SHISHANGTAOZHUANG_ID])
            {
               this.fts5.visible = true;
               this.checkHz.visible = true;
            }
            else
            {
               this.fts5.visible = false;
               this.checkHz.visible = false;
            }
            this.fts6.visible = GameState.dictMainStatus[SpecialGoodsID.JIUYINZHENJING_SISHENFUZHI_ID];
            this.suipian = GameState.dictMainStatus[SpecialGoodsID.JIUYINZHENJING_SHICONGSUIPIAN_ID];
            this.zhenyuan.visible = GameState.dictMainStatus[SpecialGoodsID.JIUYINZHENJING_ZHENYUAN_ID];
            this.zhenyuannum = GameState.dictMainStatus[SpecialGoodsID.JIUYINZHENJING_ZHENYUAN];
         }
         else
         {
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.JIUYINZHENJING_WUSHANGSHENGONG_ID];
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.JIUYINZHENJING_JIUJI_ID];
            this.fts3.visible = GameState.dictTargetStatus[SpecialGoodsID.JIUYIN_YINSHA_ID];
            this.fts4.visible = GameState.dictTargetStatus[SpecialGoodsID.QINNADIANXUESHOU_DIZI_ZIFUDONGTIAN_ID];
            if(GameState.dictTargetStatus[SpecialGoodsID.QINNADIANXUESHOU_DIZI_ZIFUDONGTIAN_ID])
            {
               this.setSkillJiHuo(OtherConst.ZIFUDONGTIAN_SKILL_ID,true);
               this.mainSkillContainer.visible = true;
               this.kuang1.visible = true;
            }
            else
            {
               this.mainSkillContainer.visible = false;
               this.kuang1.visible = false;
            }
            if(GameState.dictTargetStatus[SpecialGoodsID.JIUYINZHENJING_SHISHANGTAOZHUANG_ID])
            {
               this.fts5.visible = true;
               this.checkHz.visible = true;
            }
            else
            {
               this.fts5.visible = false;
               this.checkHz.visible = false;
            }
            this.fts6.visible = GameState.dictTargetStatus[SpecialGoodsID.JIUYINZHENJING_SISHENFUZHI_ID];
            this.suipian = GameState.dictTargetStatus[SpecialGoodsID.JIUYINZHENJING_SHICONGSUIPIAN_ID];
            this.zhenyuan.visible = GameState.dictTargetStatus[SpecialGoodsID.JIUYINZHENJING_ZHENYUAN_ID];
            this.zhenyuannum = GameState.dictTargetStatus[SpecialGoodsID.JIUYINZHENJING_ZHENYUAN];
         }
      }
      
      public function setJiuyinBuff(param1:Skill, param2:String, param3:int) : void
      {
         var _loc4_:ItemFace = null;
         var _loc5_:Bitmap = null;
         while(this.buffSpr.numChildren > 0)
         {
            this.buffSpr.removeChildAt(0);
         }
         _loc5_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.buffSpr.addChild(_loc5_);
         _loc5_.x = 0;
         _loc5_.y = 0;
         _loc4_ = new ItemFace(param1);
         _loc4_.setShowCount(false);
         _loc4_.x = 2;
         _loc4_.y = 2;
         this.buffSpr.addChild(_loc4_);
         if(param3 == 0)
         {
            _loc4_.filters = Tools.blackWhiteFilter;
         }
         else
         {
            _loc4_.filters = [];
         }
         this.miaoshu2.htmlText = "<textformat leading=\'1\'>" + param2 + "</textformat>";
      }
      
      public function setJiuyinQiu(param1:int) : void
      {
         this.dangqianId = param1;
         while(this.container.numChildren > 0)
         {
            this.container.removeChildAt(0);
         }
         var _loc2_:int = 0;
         while(_loc2_ < 9)
         {
            if(_loc2_ < param1)
            {
               this["pointIco" + _loc2_] = StaticValue.getBitmapByClassName("ui.jiuyinzhenjing.qiu.1");
            }
            else
            {
               this["pointIco" + _loc2_] = StaticValue.getBitmapByClassName("ui.jiuyinzhenjing.qiu.0");
            }
            this.container.addChild(this["pointIco" + _loc2_]);
            _loc2_++;
         }
         this.pointIco0.x = 93;
         this.pointIco0.y = 43;
         this.pointIco1.x = 71;
         this.pointIco1.y = 68;
         this.pointIco2.x = 109;
         this.pointIco2.y = 89;
         this.pointIco3.x = 147;
         this.pointIco3.y = 91;
         this.pointIco4.x = 192;
         this.pointIco4.y = 71;
         this.pointIco5.x = 226;
         this.pointIco5.y = 44;
         this.pointIco6.x = 270;
         this.pointIco6.y = 61;
         this.pointIco7.x = 315;
         this.pointIco7.y = 85;
         this.pointIco8.x = 352;
         this.pointIco8.y = 45;
      }
      
      public function bofangJiuyinYanhua() : void
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
      
      public function onShowLv(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.jiuyinzhenjingtupoCanvas.x == 142)
            {
               TweenMax.to(this.jiuyinzhenjingtupoCanvas,1,{"x":414});
               this.tupoBo = true;
            }
         }
         else if(this.jiuyinzhenjingtupoCanvas.x == 414)
         {
            TweenMax.to(this.jiuyinzhenjingtupoCanvas,1,{"x":142});
            this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_JIUYINZHENJING_ZIDONGTISHENG_CLICKJ,"",true));
            this.tupoBo = false;
         }
      }
      
      public function setJiuyinInitialize(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int) : void
      {
         this.jiuyinzhenjingtupoCanvas.setInitialize(param1,param2,param3,param4,param5,param6);
      }
      
      public function setJiuyinZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.jiuyinzhenjingtupoCanvas.setZhufuzhi(param1,param2,param3);
      }
      
      public function setJiuyinGoods(param1:Goods) : void
      {
         this.jiuyinzhenjingtupoCanvas.setGoods(param1);
      }
      
      public function setJiuyinShuoming(param1:String) : void
      {
         this.jiuyinzhenjingtupoCanvas.setShuoming(param1);
      }
      
      public function setJiuyinBtn(param1:Boolean) : void
      {
         this.jiuyinzhenjingtupoCanvas.setBtn(param1);
      }
      
      public function setJiuyinzhenjingEnabledFun() : void
      {
         this.djtpBtn.enabled = false;
         this.djtpBtnBo = false;
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
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DINGCHANJUE_SKILL_DRAG,"",this.currSkill));
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
         this.mainSkill = _loc3_;
         if(param2)
         {
            this.mainSkill.isLearn = 1;
         }
         else
         {
            this.mainSkill.isLearn = 0;
         }
         this.mainSkillItemFace = new ItemFace(this.mainSkill);
         this.mainSkillItemFace.showKungFuTag();
         this.mainSkillItemFace.setShowCount(false);
         this.mainSkillContainer.addChild(this.mainSkillItemFace);
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         if(this.isMain)
         {
            this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      public function set_JiuYinZhenJing(param1:Array) : void
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
            if(_loc3_.res.position == ItemPositionRange.POSTION_JIUYINZHENJING_SHIHUNQI)
            {
               _loc4_.x = 4 + 1;
               _loc4_.y = 4 + 1;
               this.equipContainers.addChild(_loc4_);
            }
            _loc2_++;
         }
      }
      
      public function isHuanZHuang(param1:Boolean) : void
      {
         this.checkHz.selectState = param1;
      }
   }
}

