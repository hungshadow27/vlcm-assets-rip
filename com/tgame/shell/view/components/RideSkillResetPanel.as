package com.tgame.shell.view.components
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.shell.view.components.ride.RideListRender;
   import com.tgame.shell.view.components.ride.resetSkill.RideSkillListPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.*;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class RideSkillResetPanel extends FPanel
   {
      
      public static const UI_RIDE_SKILL_RESET_SETLECT:String = "UI_RIDE_SKILL_RESET_SETLECT";
      
      public static const UI_RIDE_SKILL_RESET_LOOK:String = "UI_RIDE_SKILL_RESET_LOOK";
      
      public static const UI_RIDE_SKILL_RESET_OK:String = "UI_RIDE_SKILL_RESET_OK";
      
      public static const UI_RIDE_SKILL_RESET_SKILL_SELECT:String = "UI_RIDE_SKILL_RESET_SKILL_SELECT";
      
      private var _avatar:Bitmap;
      
      private var _mask:Shape;
      
      private var dreamBar:DreamBar;
      
      private var equipContainer:Sprite;
      
      private var skillContainer:Sprite;
      
      private var title:FLabel;
      
      public var rideList:FList;
      
      private var scroll:FVScorllBar;
      
      private var dreamValue:FTextArea;
      
      private var rideName:FLabel;
      
      private var level:FLabel;
      
      private var skillDesc:FTextArea;
      
      private var lookBtn:SmallButton;
      
      private var okBtn:SecondButton;
      
      private var skill:Skill;
      
      private var resetSkill:ItemFace;
      
      private var listPanel:RideSkillListPanel;
      
      private var headContainer:Sprite;
      
      private var headImg:Bitmap;
      
      private var headTipCanvas:FCanvas;
      
      private var solt:Bitmap;
      
      private var anju:int = 0;
      
      private var jiangsheng:int = 0;
      
      private var jiaodeng:int = 0;
      
      private var tieti:int = 0;
      
      public function RideSkillResetPanel()
      {
         var img:Bitmap;
         var container:Sprite;
         var v:Vector.<Bitmap>;
         var fb:FLabel;
         super();
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         width = 423;
         height = 433;
         titleText = LanResManager.getLanCommonTextWords("坐骑技能重置");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         img = new Bitmap();
         addChild(img);
         img.name = "ui.ride.skill.reset.ui";
         img.x = 10;
         img.y = 22;
         switch(OtherConst.mount_add_count)
         {
            case 0:
               break;
            case 1:
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 102 + 175;
               this.solt.y = 65 + 23;
               addChild(this.solt);
               break;
            case 2:
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 55 + 175 + 10;
               this.solt.y = 65 + 23;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 148 + 175 - 10;
               this.solt.y = 65 + 23;
               addChild(this.solt);
               break;
            case 3:
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 55 + 175;
               this.solt.y = 65 + 23;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 102 + 175;
               this.solt.y = 65 + 23;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 148 + 175;
               this.solt.y = 65 + 23;
               addChild(this.solt);
               break;
            case 4:
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 55 + 175;
               this.solt.y = 65 + 23;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 102 + 175;
               this.solt.y = 65 + 23;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 148 + 175;
               this.solt.y = 65 + 23;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 55 + 175;
               this.solt.y = 25 + 23;
               addChild(this.solt);
               break;
            case 5:
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 55 + 175;
               this.solt.y = 65 + 23;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 102 + 175;
               this.solt.y = 65 + 23;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 148 + 175;
               this.solt.y = 65 + 23;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 55 + 175;
               this.solt.y = 25 + 23;
               addChild(this.solt);
               this.solt = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.solt.x = 148 + 175;
               this.solt.y = 25 + 23;
               addChild(this.solt);
         }
         container = new Sprite();
         addChild(container);
         container.x = 10;
         container.y = 22;
         v = new Vector.<Bitmap>();
         v.push(img);
         this.DynamicManageImages = v;
         this._avatar = new Bitmap();
         this.title = new FLabel();
         this.title.textColor = 16777215;
         this.title.selectable = false;
         container.addChild(this.title);
         this.title.x = 40;
         this.title.y = 6;
         this.title.text = LanResManager.getLanCommonTextWords("携带数量 0/0");
         this.rideList = new FList();
         this.rideList.skin = "list";
         this.rideList.itemRenderer = new RideListRender();
         this.rideList.listWidth = 142;
         container.addChild(this.rideList);
         this.rideList.x = 5;
         this.rideList.y = 28;
         this.rideList.addEventListener(MouseEvent.CLICK,this.onListClick);
         this.scroll = new FVScorllBar(this.rideList,112);
         container.addChild(this.scroll);
         this.scroll.x = 148;
         this.scroll.y = 28;
         this.equipContainer = new Sprite();
         container.addChild(this.equipContainer);
         this.equipContainer.x = 175;
         this.equipContainer.y = 23;
         with(this.equipContainer.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,220,80);
            endFill();
         }
         this.skillContainer = new Sprite();
         container.addChild(this.skillContainer);
         this.skillContainer.x = 13;
         this.skillContainer.y = 183;
         this.skillContainer.addEventListener(MouseEvent.CLICK,this.selectSkill);
         this.dreamBar = new DreamBar();
         container.addChild(this.dreamBar);
         this.dreamBar.y = 105;
         this.dreamBar.x = 286 - this.dreamBar.width / 2;
         fb = new FLabel();
         with(fb)
         {
            x = 20;
            y = 4;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         fb.text = LanResManager.getLanTextWords(this,0);
         addChild(fb);
         fb = new FLabel();
         with(fb)
         {
            x = 198;
            y = 152;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("名称");
         }
         addChild(fb);
         this.rideName = new FLabel();
         with(this.rideName)
         {
            x = 230;
            y = 152;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("名称");
         }
         addChild(this.rideName);
         fb = new FLabel();
         with(fb)
         {
            x = 338;
            y = 152;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("等级");
         }
         addChild(fb);
         this.level = new FLabel();
         with(this.level)
         {
            x = 368;
            y = 152;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "11";
         }
         addChild(this.level);
         fb = new FLabel();
         with(fb)
         {
            x = 20;
            y = 176;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         fb.text = LanResManager.getLanTextWords(this,1);
         addChild(fb);
         fb = new FLabel();
         with(fb)
         {
            x = 20;
            y = 254;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         fb.text = LanResManager.getLanTextWords(this,2);
         addChild(fb);
         fb = new FLabel();
         with(fb)
         {
            x = 20;
            y = 363;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
         }
         fb.text = LanResManager.getLanTextWords(this,3);
         addChild(fb);
         this.skillDesc = new FTextArea();
         with(this.skillDesc)
         {
            x = 78;
            y = 286;
            width = 323;
            height = 64;
            wordWrap = true;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         addChild(this.skillDesc);
         this.lookBtn = new SmallButton();
         with(this.lookBtn)
         {
            label = LanResManager.getLanTextWords(this,"查阅");
            x = 21;
            y = 322;
            addEventListener(MouseEvent.CLICK,onClick);
         }
         addChild(this.lookBtn);
         this.okBtn = new SecondButton();
         with(this.okBtn)
         {
            label = LanResManager.getLanTextWords(this,"确定重置");
            x = 324;
            y = 359;
            addEventListener(MouseEvent.CLICK,onClick);
         }
         addChild(this.okBtn);
         this.headContainer = new Sprite();
         this.headContainer.x = 309 - 45 + 15;
         this.headContainer.y = 25 + 23;
         addChild(this.headContainer);
         this.headContainer.addEventListener(MouseEvent.MOUSE_OVER,this.onHeadMouseTip);
         this.headContainer.addEventListener(MouseEvent.MOUSE_OUT,this.onHeadMouseTip);
         this.headImg = new Bitmap();
         this.headTipCanvas = new FCanvas();
         this.headTipCanvas.skin = "menuBg";
         this.headTipCanvas.addChild(this._avatar);
      }
      
      private function reset() : void
      {
         while(this.equipContainer.numChildren)
         {
            this.equipContainer.removeChildAt(0);
         }
         while(this.skillContainer.numChildren)
         {
            this.skillContainer.removeChildAt(0);
         }
         this.rideName.text = "";
         this.level.text = "";
         this.skill = null;
         if(Boolean(this.resetSkill) && Boolean(this.resetSkill.parent))
         {
            this.resetSkill.parent.removeChild(this.resetSkill);
         }
         this.skillDesc.htmlText = "";
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
         var e:MouseEvent = param1;
         switch(e.target)
         {
            case this.lookBtn:
               dispatchEvent(new BaseEvent(UI_RIDE_SKILL_RESET_LOOK));
               break;
            case this.okBtn:
               if(!this.skill || !this.resetSkill || !this.resetSkill.visible)
               {
                  return;
               }
               FAlert.okLabel = LanResManager.getLanTextWords(this,"确定重置");
               FAlert.cancelLabel = LanResManager.getLanTextWords(this,"我再想想");
               FAlert.show("<textformat leading=\'6\'>" + LanResManager.getLanTextWords(this,4,[this.rideName.text,this.skill.res.name,(this.resetSkill.getBaseItem() as Skill).res.name]) + "</textformat>","",2,function(param1:FAlertEvent):void
               {
                  if(param1.eventData == FAlert.OK)
                  {
                     dispatchEvent(new BaseEvent(UI_RIDE_SKILL_RESET_OK,"",[skill,resetSkill.getBaseItem()]));
                  }
               });
         }
      }
      
      private function selectSkill(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         this.skill = Skill((param1.target as ItemFace).getBaseItem());
         var _loc3_:int = this.skillContainer.numChildren;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            (this.skillContainer.getChildAt(_loc2_) as ItemFace).showFram = false;
            _loc2_++;
         }
         (param1.target as ItemFace).showFram = true;
      }
      
      private function onListClick(param1:MouseEvent = null) : void
      {
         this.reset();
         if(!this.rideList.selectItem)
         {
            return;
         }
         dispatchEvent(new BaseEvent(UI_RIDE_SKILL_RESET_SETLECT,"",int(this.rideList.selectItem.label)));
      }
      
      public function setRidelist(param1:XML, param2:String) : void
      {
         this.reset();
         this.rideList.dataProvider = param1;
         this.title.text = LanResManager.getLanTextWords(this,"携带数量 ") + param2;
         if(param1.children().length() > 0)
         {
            this.rideList.setSelectItemByIndex(0);
            if(!this.rideList.selectItem)
            {
               return;
            }
            dispatchEvent(new BaseEvent(UI_RIDE_SKILL_RESET_SETLECT,"",int(this.rideList.selectItem.label)));
         }
         this.scroll.update();
      }
      
      public function setRide(param1:String, param2:int) : void
      {
         this.rideName.text = param1;
         this.level.text = param2.toString();
      }
      
      public function setEquip(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:Goods = null;
         var _loc5_:ItemFace = null;
         while(this.equipContainer.numChildren > 0)
         {
            this.equipContainer.removeChildAt(0);
         }
         this.anju = 0;
         this.jiangsheng = 0;
         this.jiaodeng = 0;
         this.tieti = 0;
         var _loc3_:int = int(param1.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = param1[_loc2_] as Goods;
            _loc5_ = new ItemFace(_loc4_);
            _loc5_.showRedMask();
            _loc5_.showStrengthenLv = true;
            this.equipContainer.addChild(_loc5_);
            switch(_loc4_.position)
            {
               case ItemPositionRange.POSTION_HOURSE_ANJU:
                  _loc5_.x = 0;
                  _loc5_.y = 2;
                  if(_loc4_.id == 370150)
                  {
                     this.anju = 1;
                  }
                  else if(_loc4_.id == 372028)
                  {
                     this.anju = 2;
                  }
                  else
                  {
                     this.anju = 0;
                  }
                  break;
               case ItemPositionRange.POSTION_HOURSE_JIANGSHENG:
                  _loc5_.x = 0;
                  _loc5_.y = 47;
                  if(_loc4_.id == 370151)
                  {
                     this.jiangsheng = 1;
                  }
                  else if(_loc4_.id == 372029)
                  {
                     this.jiangsheng = 2;
                  }
                  else
                  {
                     this.jiangsheng = 0;
                  }
                  break;
               case ItemPositionRange.POSTION_HOURSE_TIJU:
                  _loc5_.x = 186;
                  _loc5_.y = 2;
                  if(_loc4_.id == 370152)
                  {
                     this.jiaodeng = 1;
                  }
                  else if(_loc4_.id == 372030)
                  {
                     this.jiaodeng = 2;
                  }
                  else
                  {
                     this.jiaodeng = 0;
                  }
                  break;
               case ItemPositionRange.POSTION_HOURSE_TITIE:
                  _loc5_.x = 186;
                  _loc5_.y = 47;
                  if(_loc4_.id == 370153)
                  {
                     this.tieti = 1;
                  }
                  else if(_loc4_.id == 372031)
                  {
                     this.jiaodeng = 2;
                  }
                  else
                  {
                     this.tieti = 0;
                  }
                  break;
               case ItemPositionRange.POSTION_HOURSE_NEW1:
                  if(OtherConst.mount_add_count == 2)
                  {
                     _loc5_.x = 47 + 10;
                     _loc5_.y = 45;
                  }
                  else
                  {
                     _loc5_.x = 94;
                     _loc5_.y = 45;
                  }
                  break;
               case ItemPositionRange.POSTION_HOURSE_NEW2:
                  if(OtherConst.mount_add_count == 2)
                  {
                     _loc5_.x = 140 - 10;
                     _loc5_.y = 45;
                  }
                  else
                  {
                     _loc5_.x = 47;
                     _loc5_.y = 45;
                  }
                  break;
               case ItemPositionRange.POSTION_HOURSE_NEW3:
                  _loc5_.x = 140;
                  _loc5_.y = 45;
                  break;
               case ItemPositionRange.POSTION_HOURSE_NEW4:
                  _loc5_.x = 47;
                  _loc5_.y = 5;
                  break;
               case ItemPositionRange.POSTION_HOURSE_NEW5:
                  _loc5_.x = 140;
                  _loc5_.y = 5;
            }
            _loc2_++;
         }
      }
      
      public function setSkill(param1:Object) : void
      {
         var _loc3_:ItemFace = null;
         var _loc4_:Skill = null;
         while(this.skillContainer.numChildren > 0)
         {
            this.skillContainer.removeChildAt(0);
         }
         var _loc2_:int = 0;
         for each(_loc4_ in param1)
         {
            _loc3_ = new ItemFace(_loc4_ as Skill);
            _loc3_.setShowCount(false);
            this.skillContainer.addChild(_loc3_);
            _loc3_.x = 49 * _loc2_;
            _loc2_++;
         }
      }
      
      public function setResetSkill(param1:Skill) : void
      {
         if(Boolean(this.resetSkill) && Boolean(this.resetSkill.parent))
         {
            this.resetSkill.parent.removeChild(this.resetSkill);
         }
         if(!param1)
         {
            return;
         }
         this.resetSkill = new ItemFace(param1);
         this.resetSkill.setShowCount(false);
         addChild(this.resetSkill);
         this.resetSkill.x = 22;
         this.resetSkill.y = 280;
         this.skillDesc.htmlText = "<textformat leading=\'8\'>【" + param1.res.name + "】  【" + (param1.res.useway == 1 ? LanResManager.getLanCommonTextWords("主动技能") : LanResManager.getLanCommonTextWords("被动技能")) + "】<br>" + param1.res.desc + "</textformat>";
      }
      
      public function setAvatar(param1:BitmapData, param2:int) : void
      {
         while(this.headContainer.numChildren > 0)
         {
            this.headContainer.removeChildAt(0);
         }
         this.avatar = param1;
         if(param2 == 0)
         {
            return;
         }
         this.headImg = ResPathManager.getSmallICO(param2);
         this.headContainer.addChild(this.headImg);
      }
      
      public function set avatar(param1:BitmapData) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         this._avatar.scaleX = this._avatar.scaleY = 1;
         this._avatar.bitmapData = param1;
         var _loc2_:Rectangle = new Rectangle();
         if(!param1)
         {
            return;
         }
         if(this._avatar.width >= 512 && this._avatar.height >= 209)
         {
            _loc2_ = this._avatar.bitmapData.getColorBoundsRect(4278190080,0,false);
            if(_loc2_.width > 203)
            {
               this._avatar.scaleX = this._avatar.scaleY = 203 / _loc2_.width;
            }
            this._avatar.x = 290 - this._avatar.width / 2 - 270 + 80;
            this._avatar.y = 63 - this._avatar.height / 2 + 20;
         }
         else
         {
            _loc3_ = 1;
            if(this._avatar.height != 84)
            {
               _loc3_ = 84 / this._avatar.height;
            }
            _loc2_ = this._avatar.bitmapData.getColorBoundsRect(4278190080,0,false);
            this._avatar.bitmapData = new BitmapData(_loc2_.width,_loc2_.height,true,0);
            this._avatar.bitmapData.copyPixels(param1,_loc2_,new Point(0,0));
            _loc4_ = 1;
            if(_loc2_.width > 148)
            {
               _loc4_ = 148 / _loc2_.width;
            }
            this._avatar.scaleX = this._avatar.scaleY = _loc3_ > _loc4_ ? _loc4_ : _loc3_;
            this._avatar.x = 286 - this._avatar.width / 2 - 270 + 100;
            this._avatar.y = 63 - this._avatar.height / 2 + 20;
         }
      }
      
      public function setDreamBarPercentage(param1:int, param2:int, param3:int, param4:int, param5:int, param6:Boolean, param7:int, param8:int, param9:int, param10:int) : void
      {
         this.dreamBar.setValue(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
         this.dreamBar.setHeianGuangming(this.anju,this.jiangsheng,this.jiaodeng,this.tieti);
      }
      
      public function showSkillListPanel(param1:Array) : void
      {
         if(!this.listPanel)
         {
            this.listPanel = new RideSkillListPanel();
            this.listPanel.$parent = this;
         }
         this.listPanel.visible = true;
         this.listPanel.setData(param1);
         GameInstance.uiInstance.uiContainer.addChild(this.listPanel);
         this.listPanel.x = (GameConfig.sceneWidth - this.listPanel.panelWidth) / 2;
         this.listPanel.y - (GameConfig.sceneHeight - this.listPanel.panelHeight) / 2;
      }
      
      private function onHeadMouseTip(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.headContainer.addEventListener(MouseEvent.MOUSE_MOVE,this.onHeadMouseTip);
               break;
            case MouseEvent.MOUSE_MOVE:
               if(this._avatar == null)
               {
                  return;
               }
               if(this.headTipCanvas.getChildByName("avatar") == null)
               {
                  this.headTipCanvas.addChild(this._avatar);
               }
               Tools.currentStage.addChild(this.headTipCanvas);
               this.headTipCanvas.width = 240;
               this.headTipCanvas.height = 170;
               this.headTipCanvas.x = Tools.currentStage.mouseX + 15;
               this.headTipCanvas.y = Tools.currentStage.mouseY + 25;
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.headTipCanvas.parent != null)
               {
                  this.headTipCanvas.parent.removeChild(this.headTipCanvas);
               }
               this.headContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onHeadMouseTip);
         }
      }
   }
}

