package com.asQuery
{
   import com.greensock.TweenLite;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public final class ASQueryObject
   {
      
      private var _list:Array;
      
      private var _root:DisplayObjectContainer;
      
      private var _selector:*;
      
      public function ASQueryObject(param1:DisplayObjectContainer, param2:*, param3:Boolean = false)
      {
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Array = null;
         super();
         this._root = param1;
         this._selector = param2;
         this._list = [];
         if(param2 == null)
         {
            return;
         }
         if(param2 is ASQueryObject)
         {
            this._root = ASQueryObject(param2)._root;
            this._list = ASQueryObject(param2)._list;
         }
         if(param2 is String)
         {
            if(param2 == "")
            {
               this._list.push(ASQueryConfig.stage);
            }
            else
            {
               _loc4_ = String(param2).split(" ");
               _loc5_ = 0;
               _loc6_ = int(_loc4_.length);
               while(_loc5_ < _loc6_)
               {
                  _loc7_ = [];
                  if(param3)
                  {
                     ASQueryHelper.findChildByName(_loc4_[_loc5_],this._root,_loc7_);
                  }
                  else
                  {
                     ASQueryHelper.findAllChildByName(_loc4_[_loc5_],this._root,_loc7_);
                  }
                  this._list = this._list.concat(_loc7_);
                  _loc5_++;
               }
            }
         }
         else if(param2 is Class)
         {
            if(param3)
            {
               ASQueryHelper.findChildByClass(param2,this._root,this._list);
            }
            else
            {
               ASQueryHelper.findAllChildByClass(param2,this._root,this._list);
            }
         }
         else if(param2 is DisplayObject)
         {
            this._list.push(param2);
         }
         else if(param2 is Array)
         {
            this._list = (param2 as Array).concat();
         }
      }
      
      public function ready(param1:Function) : void
      {
         var fun:Function = param1;
         this.all(function(param1:DisplayObject):void
         {
            if(param1.stage != null)
            {
               fun();
            }
            else
            {
               $(param1).bindOnce(Event.ADDED_TO_STAGE,fun);
            }
         });
      }
      
      public function attr(param1:*, param2:* = null) : ASQueryObject
      {
         var name:* = param1;
         var value:* = param2;
         this.all(function(param1:DisplayObject):void
         {
            var _loc2_:String = null;
            if(name is String)
            {
               ASQueryHelper.setAttr(param1,String(name),value);
            }
            else
            {
               for(_loc2_ in name)
               {
                  ASQueryHelper.setAttr(param1,_loc2_,name[_loc2_]);
               }
            }
         });
         return this;
      }
      
      public function getAttr(param1:String) : *
      {
         return this.get()[param1];
      }
      
      public function fun(param1:String, param2:Array = null) : ASQueryObject
      {
         var name:String = param1;
         var params:Array = param2;
         this.all(function(param1:DisplayObject):void
         {
            if(name is String)
            {
               param1[name].apply(null,params);
            }
         });
         return this;
      }
      
      public function all(param1:Function) : ASQueryObject
      {
         var _loc2_:int = int(this._list.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.call(null,this._list[_loc3_]);
            _loc3_++;
         }
         return this;
      }
      
      public function find(param1:*, param2:Boolean = false) : ASQueryObject
      {
         var newQuery:ASQueryObject = null;
         var selector:* = param1;
         var onlyChild:Boolean = param2;
         newQuery = new ASQueryObject(this._root,null);
         newQuery._selector = selector;
         this.all(function(param1:DisplayObject):void
         {
            if(param1 is DisplayObjectContainer)
            {
               newQuery._list = newQuery._list.concat($(selector,DisplayObjectContainer(param1),onlyChild)._list);
            }
         });
         return newQuery;
      }
      
      public function bind(param1:String, param2:Function) : ASQueryObject
      {
         var type:String = param1;
         var handler:Function = param2;
         this.all(function(param1:DisplayObject):void
         {
            ASQueryListenerMap.getInstance().add(param1,type,handler);
         });
         return this;
      }
      
      public function unbind(param1:String = null, param2:Function = null) : ASQueryObject
      {
         var type:String = param1;
         var handler:Function = param2;
         this.all(function(param1:DisplayObject):void
         {
            ASQueryListenerMap.getInstance().remove(param1,type,handler);
         });
         return this;
      }
      
      public function bindOnce(param1:String, param2:Function) : ASQueryObject
      {
         var type:String = param1;
         var handler:Function = param2;
         this.all(function(param1:DisplayObject):void
         {
            var item:DisplayObject = param1;
            ASQueryListenerMap.getInstance().add(item,type,function(param1:*):void
            {
               $(item).unbind(type,handler);
               var _loc2_:int = handler.length;
               if(_loc2_ == 0)
               {
                  handler();
               }
               else if(_loc2_ == 1)
               {
                  handler(param1);
               }
               else
               {
                  handler(param1,param1.data);
               }
            },handler);
         });
         return this;
      }
      
      public function trigger(param1:Event) : ASQueryObject
      {
         var event:Event = param1;
         this.all(function(param1:DisplayObject):void
         {
            param1.dispatchEvent(event);
         });
         return this;
      }
      
      public function get(param1:int = 0) : DisplayObject
      {
         if(param1 < this._list.length)
         {
            return this._list[param1];
         }
         return null;
      }
      
      public function length() : int
      {
         return this._list.length;
      }
      
      public function getContainer(param1:int = 0) : DisplayObjectContainer
      {
         var _loc2_:int = int(this._list.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(_loc3_ == param1 && this._list[_loc3_] is DisplayObjectContainer)
            {
               return this._list[_loc3_] as DisplayObjectContainer;
            }
            _loc3_++;
         }
         return null;
      }
      
      public function click(param1:Function) : ASQueryObject
      {
         return this.bind(MouseEvent.CLICK,param1);
      }
      
      public function mouseover(param1:Function) : ASQueryObject
      {
         return this.bind(MouseEvent.MOUSE_OVER,param1);
      }
      
      public function mousemove(param1:Function) : ASQueryObject
      {
         return this.bind(MouseEvent.MOUSE_MOVE,param1);
      }
      
      public function mouseout(param1:Function) : ASQueryObject
      {
         return this.bind(MouseEvent.MOUSE_OUT,param1);
      }
      
      public function mousedown(param1:Function) : ASQueryObject
      {
         return this.bind(MouseEvent.MOUSE_DOWN,param1);
      }
      
      public function mouseup(param1:Function) : ASQueryObject
      {
         return this.bind(MouseEvent.MOUSE_UP,param1);
      }
      
      public function toggle(param1:String = null) : ASQueryObject
      {
         var name:String = param1;
         if(name == null)
         {
            name = "visible";
         }
         this.all(function(param1:DisplayObject):void
         {
            param1[name] = !param1[name];
         });
         return this;
      }
      
      public function append(param1:*) : ASQueryObject
      {
         var container:DisplayObjectContainer = null;
         var child:* = param1;
         container = this.getContainer();
         if(container == null)
         {
            return this;
         }
         new ASQueryObject(this._root,child).all(function(param1:DisplayObject):void
         {
            container.addChild(child);
         });
         return this;
      }
      
      public function appendTo(param1:*) : ASQueryObject
      {
         var container:DisplayObjectContainer = null;
         var parent:* = param1;
         container = new ASQueryObject(this._root,parent).getContainer();
         if(container == null)
         {
            return this;
         }
         this.all(function(param1:DisplayObject):void
         {
            container.addChild(param1);
         });
         return this;
      }
      
      public function remove() : ASQueryObject
      {
         this.all(function(param1:DisplayObject):void
         {
            param1.parent.removeChild(param1);
         });
         return this;
      }
      
      public function empty() : ASQueryObject
      {
         this.all(function(param1:DisplayObject):void
         {
            var _loc2_:DisplayObjectContainer = param1 as DisplayObjectContainer;
            if(_loc2_ != null)
            {
               while(_loc2_.numChildren)
               {
                  _loc2_.removeChildAt(0);
               }
            }
         });
         return this;
      }
      
      public function setVisible(param1:Boolean) : ASQueryObject
      {
         var b:Boolean = param1;
         this.all(function(param1:DisplayObject):void
         {
            param1.visible = b;
         });
         return this;
      }
      
      public function setPosition(param1:Number, param2:Number) : ASQueryObject
      {
         var x:Number = param1;
         var y:Number = param2;
         this.all(function(param1:DisplayObject):void
         {
            param1.x = x;
            param1.y = y;
         });
         return this;
      }
      
      public function addPosition(param1:Number, param2:Number) : ASQueryObject
      {
         var x:Number = param1;
         var y:Number = param2;
         this.all(function(param1:DisplayObject):void
         {
            param1.x += x;
            param1.y += y;
         });
         return this;
      }
      
      public function setRotation(param1:Number) : ASQueryObject
      {
         var r:Number = param1;
         this.all(function(param1:DisplayObject):void
         {
            param1.rotation = r;
         });
         return this;
      }
      
      public function setIndexTop() : ASQueryObject
      {
         this.all(function(param1:DisplayObject):void
         {
            param1.parent.setChildIndex(param1,param1.parent.numChildren - 1);
         });
         return this;
      }
      
      public function setIndexBottom() : ASQueryObject
      {
         this.all(function(param1:DisplayObject):void
         {
            param1.parent.setChildIndex(param1,0);
         });
         return this;
      }
      
      public function tween(param1:Number, param2:Object) : ASQueryObject
      {
         var duration:Number = param1;
         var vars:Object = param2;
         this.all(function(param1:DisplayObject):void
         {
            TweenLite.to(param1,duration,vars);
         });
         return this;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "list:";
         var _loc2_:int = int(this._list.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ += this._list[_loc3_] + ",";
            _loc3_++;
         }
         _loc1_ = _loc1_.substr(0,_loc1_.length - 1);
         return "[AsQueryObject]\r selector:" + this._selector + "\r root:" + this._root + "\r " + _loc1_;
      }
      
      public function dispose() : void
      {
         this.all(function(param1:DisplayObject):void
         {
            var _loc2_:DisplayObjectContainer = null;
            var _loc3_:DisplayObject = null;
            ASQueryListenerMap.getInstance().remove(param1);
            if(param1 is Bitmap)
            {
               Bitmap(param1).bitmapData.dispose();
            }
            if(param1 is DisplayObjectContainer)
            {
               _loc2_ = param1 as DisplayObjectContainer;
               while(_loc2_.numChildren > 0)
               {
                  _loc3_ = _loc2_.removeChildAt(0);
                  $(_loc3_).dispose();
               }
            }
            if(param1.hasOwnProperty("dispose") == true)
            {
               param1["dispose"]();
            }
            if(param1.hasOwnProperty("destory") == true)
            {
               param1["destory"]();
            }
            if(param1.parent != null)
            {
               param1.parent.removeChild(param1);
            }
         });
         this._list = null;
         this._root = null;
         this._selector = null;
      }
   }
}

