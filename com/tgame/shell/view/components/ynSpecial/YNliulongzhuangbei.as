package com.tgame.shell.view.components.ynSpecial
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
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
   
   public class YNliulongzhuangbei extends Sprite
   {
      
      private var ft1:FTextArea;
      
      private var ft2:FTextArea;
      
      private var equipContainer:Sprite;
      
      private var isMain:Boolean = false;
      
      public var $parent:DisplayObject;
      
      private var p:Point;
      
      private var currSkill:ItemFace;
      
      private var isDrag:Boolean = false;
      
      private var skillContainer:Sprite;
      
      private var arrGO:Array;
      
      private var gongImgObj:Object;
      
      private var ft3:FTextArea;
      
      private var ft4:FTextArea;
      
      public function YNliulongzhuangbei()
      {
         this.arrGO = [];
         this.gongImgObj = {};
         super();
         this.init();
         this.ft3 = new FTextArea();
         this.ft3.textColor = StaticValue.GREEN;
         this.ft3.filters = StaticValue.filter;
         this.ft3.x = 300;
         this.ft3.y = 10;
         this.ft3.width = 125;
         this.ft3.height = 22;
         this.ft3.text = new Goods(730466).res.name;
         this.ft3.visible = false;
         addChild(this.ft3);
         ToolTips.createToolTips(this.ft3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Long Thần Hộ Thể giúp bản thân khi chiến đấu có khả năng bỏ qua thần uy của Thần Thú " + "<br>" + "Đỉnh Phong – Vọng Thiên Hống của đối thủ." + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.ft4 = new FTextArea();
         this.ft4.textColor = StaticValue.GREEN;
         this.ft4.filters = StaticValue.filter;
         this.ft4.x = 300;
         this.ft4.y = 190;
         this.ft4.width = 125;
         this.ft4.height = 22;
         this.ft4.text = "Cửu Long Cầu Phúc";
         this.ft4.visible = false;
         addChild(this.ft4);
         ToolTips.createToolTips(this.ft4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Cửu Long Cầu Phúc" + "<br>" + "Hiệu quả: Tất cả đối thủ đã kích bản thân sẽ mất toàn bộ hiểu quả đặc biệt đang có. Bên cạnh đó, sẽ mất" + "<br>" + "toàn bộ điểm Thể Lực, Tấn Công, Bạo Kích" + "<br>" + "Thời gian hiệu quả kéo dài 9 giây. Thời gian chờ là 90 giây." + "</font>";
            return _loc1_ + "</textformat>";
         });
      }
      
      private function init() : void
      {
         var bg2:DisplayObject;
         var ft:FTextArea;
         var selectMc:MovieClip = null;
         var urlselect:String = null;
         var bg1:DisplayObject = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/liulongzhuangbei/bg1.swf");
         bg1.x = 2;
         bg1.y = 2;
         addChild(bg1);
         selectMc = new MovieClip();
         urlselect = GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/liulongzhuangbei/long.swf";
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != urlselect)
            {
               return;
            }
            if(Boolean(selectMc) && selectMc.parent != null)
            {
               selectMc.stop();
               selectMc.parent.removeChild(selectMc);
            }
            if(gongImgObj[1] != null)
            {
               selectMc = gongImgObj[1];
            }
            else
            {
               selectMc = _loc2_.content as MovieClip;
               gongImgObj[1] = selectMc;
            }
            if(selectMc)
            {
               selectMc.x = 2;
               addChild(selectMc);
            }
         },null,false,urlselect);
         bg2 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/liulongzhuangbei/bg2.swf");
         bg2.x = 2;
         bg2.y = 201;
         addChild(bg2);
         ft = new FTextArea();
         ft.x = 30;
         ft.y = 210;
         ft.textColor = StaticValue.YELLOW;
         ft.htmlText = "六龙装备描述1：";
         ft = new FTextArea();
         ft.x = 30;
         ft.y = 230;
         ft.textColor = StaticValue.YELLOW;
         ft.htmlText = "六龙装备描述2：";
         this.ft1 = new FTextArea();
         this.ft1.x = 130;
         this.ft1.y = 210;
         this.ft1.textColor = StaticValue.YELLOW;
         this.ft1.htmlText = "";
         addChild(this.ft1);
         this.ft2 = new FTextArea();
         this.ft2.x = 130;
         this.ft2.y = 230;
         this.ft2.textColor = StaticValue.YELLOW;
         this.ft2.htmlText = "";
         addChild(this.ft2);
         this.equipContainer = new Sprite();
         this.equipContainer.x = 35;
         this.equipContainer.y = 250;
         with(this.equipContainer.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,340,50);
            endFill();
         }
         this.equipContainer.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick,false,30);
         this.skillContainer = new Sprite();
         this.skillContainer.x = 35;
         this.skillContainer.y = 310;
         addChild(this.skillContainer);
         with(this.skillContainer.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,340,50);
            endFill();
         }
         this.skillContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         this.skillContainer.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         addChild(this.equipContainer);
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         this.skillContainer.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         this.p = new Point(mouseX,mouseY);
         this.currSkill = param1.target as ItemFace;
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         if(this.currSkill != param1.target)
         {
            this.skillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            if((this.currSkill.getBaseItem() as Skill).res.useway == 1 && (this.currSkill.getBaseItem() as Skill).isLearn == 1)
            {
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_YNLIULONGZHUANGBEI_SKILL_DRAG,"",this.currSkill));
            }
            this.skillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         }
      }
      
      private function onMouseUp(param1:MouseEvent) : void
      {
         this.skillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         var _loc2_:ItemFace = null;
         var _loc3_:Goods = null;
         if(this.isMain)
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
            this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      public function setData(param1:Array, param2:String, param3:String, param4:Boolean) : void
      {
         this.isMain = param4;
         this.set_Equip(param1,this.isMain);
         this.ft1.htmlText = param2;
         this.ft2.htmlText = param3;
      }
      
      public function set_Equip(param1:Array, param2:Boolean = false) : void
      {
         var _loc3_:int = 0;
         var _loc5_:Goods = null;
         var _loc6_:ItemFace = null;
         var _loc7_:Bitmap = null;
         var _loc8_:DisplayObject = null;
         var _loc9_:Skill = null;
         var _loc10_:ItemFace = null;
         var _loc11_:int = 0;
         while(this.equipContainer.numChildren > 0)
         {
            this.equipContainer.removeChildAt(0);
         }
         this.arrGO = [];
         _loc3_ = 0;
         while(_loc3_ < param1.length)
         {
            _loc5_ = param1[_loc3_] as Goods;
            _loc6_ = new ItemFace(_loc5_);
            switch(ItemPositionRange.POSITION_LLZB.indexOf(_loc5_.res.position))
            {
               case 0:
                  _loc6_.x = 2 + 60 * 0;
                  _loc6_.y = 2;
                  this.equipContainer.addChild(_loc6_);
                  if(_loc5_.id == 723929)
                  {
                     this.arrGO.push(80200280);
                  }
                  break;
               case 1:
                  _loc6_.x = 2 + 60 * 1;
                  _loc6_.y = 2;
                  this.equipContainer.addChild(_loc6_);
                  if(_loc5_.id == 723940)
                  {
                     this.arrGO.push(80200281);
                  }
                  break;
               case 2:
                  _loc6_.x = 2 + 60 * 2;
                  _loc6_.y = 2;
                  this.equipContainer.addChild(_loc6_);
                  if(_loc5_.id == 723951)
                  {
                     this.arrGO.push(80200282);
                  }
                  break;
               case 3:
                  _loc6_.x = 2 + 60 * 3;
                  _loc6_.y = 2;
                  this.equipContainer.addChild(_loc6_);
                  if(_loc5_.id == 723962)
                  {
                     this.arrGO.push(80200283);
                  }
                  break;
               case 4:
                  _loc6_.x = 2 + 60 * 4;
                  _loc6_.y = 2;
                  this.equipContainer.addChild(_loc6_);
                  if(_loc5_.id == 723973)
                  {
                     this.arrGO.push(80200284);
                  }
                  break;
               case 5:
                  _loc6_.x = 2 + 60 * 5;
                  _loc6_.y = 2;
                  this.equipContainer.addChild(_loc6_);
                  if(_loc5_.id == 723984)
                  {
                     this.arrGO.push(80200285);
                  }
            }
            if(param2)
            {
               this.ft3.visible = GameState.dictMainStatus[730466];
               this.ft4.visible = GameState.dictMainStatus[731897];
            }
            else
            {
               this.ft3.visible = GameState.dictTargetStatus[730466];
               this.ft4.visible = GameState.dictTargetStatus[731897];
            }
            _loc3_++;
         }
         var _loc4_:Array = [80200280,80200281,80200282,80200283,80200284,80200285];
         _loc3_ = 0;
         while(_loc3_ < 6)
         {
            _loc7_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
            _loc7_.x = 35 + 60 * _loc3_;
            _loc7_.y = 250;
            addChildAt(_loc7_,2);
            _loc8_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/liulongzhuangbei/jt.swf");
            _loc8_.x = 35 + 12 + 60 * _loc3_;
            _loc8_.y = 250 + 42;
            addChild(_loc8_);
            _loc7_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
            _loc7_.x = 60 * _loc3_;
            _loc7_.y = 0;
            this.skillContainer.addChild(_loc7_);
            _loc9_ = new Skill(_loc4_[_loc3_]);
            _loc10_ = new ItemFace(_loc9_);
            _loc10_.x = 2 + 60 * _loc3_;
            _loc10_.y = 2;
            _loc10_.setShowCount(false);
            if(this.arrGO.length != 0)
            {
               _loc11_ = 0;
               while(_loc11_ < this.arrGO.length)
               {
                  if(this.arrGO.indexOf(_loc4_[_loc3_]) != -1)
                  {
                     _loc9_.isLearn = 1;
                     _loc10_.filters = [];
                  }
                  else
                  {
                     _loc9_.isLearn = 0;
                     _loc10_.filters = Tools.blackWhiteFilter;
                  }
                  _loc11_++;
               }
            }
            else
            {
               _loc9_.isLearn = 0;
               _loc10_.filters = Tools.blackWhiteFilter;
            }
            this.skillContainer.addChild(_loc10_);
            _loc3_++;
         }
      }
   }
}

