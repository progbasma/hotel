(()=>{"use strict";var e={3744:(e,t)=>{t.Z=(e,t)=>{const a=e.__vccOpts||e;for(const[e,o]of t)a[e]=o;return a}}},t={};function a(o){var l=t[o];if(void 0!==l)return l.exports;var n=t[o]={exports:{}};return e[o](n,n.exports,a),n.exports}(()=>{const e=Vue;var t=(0,e.createElementVNode)("div",{id:"dates-calendar",class:"dates-calendar"},null,-1),o={id:"modal-calendar",class:"modal fade"},l={class:"modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable",role:"document"},n={class:"modal-content"},r=(0,e.createElementVNode)("div",{class:"modal-header"},[(0,e.createElementVNode)("h5",{class:"modal-title"}),(0,e.createElementVNode)("button",{type:"button",class:"btn-close","data-bs-dismiss":"modal","aria-label":"Close"})],-1),i={class:"modal-body"},d={class:"form_modal_calendar form-horizontal",novalidate:"",onsubmit:"return false"},s={class:"form-group"},m=(0,e.createElementVNode)("br",null,null,-1),c={class:"row"},u={class:"col-md-6"},v={class:"form-group"},f={for:"price-input"},_={class:"col-md-6"},b={class:"form-group"},p=(0,e.createElementVNode)("br",null,null,-1),h=["selected"],y=["selected"],g=["selected"],V={key:0,class:"row"},E={class:"col-md-12 text-info"},N={class:"row"},D={class:"col-md-6"},S={class:"form-group"},w={for:"number-of-rooms"},x={class:"modal-footer"},Y={type:"button",class:"btn btn-secondary","data-bs-dismiss":"modal"};const M={data:function(){return{form:{id:"",value:"",value_type:"fixed",start_date:"",end_date:"",enable_person:0,min_guests:0,max_guests:0,active:0,number_of_rooms:1},formDefault:{id:"",value:"",start_date:"",end_date:"",enable_person:0,min_guests:0,max_guests:0,active:0,number_of_rooms:1},onSubmit:!1,calendar:null}},methods:{show:function(e){$("#modal-calendar").modal("show"),this.onSubmit=!1,void 0!==e&&(this.form=Object.assign({},e),e.start_date&&$(".modal-title").text(moment(e.start_date).format("MM/DD/YYYY")))},hide:function(){$("#modal-calendar").modal("hide"),this.form=Object.assign({},this.formDefault)},saveForm:function(){var e=this,t=this;this.onSubmit||this.validateForm()&&($("#modal-calendar").find(".btn-primary").addClass("button-loading"),this.onSubmit=!0,$.ajax({url:$("div[data-get-room-availability-url]").data("get-room-availability-url"),data:this.form,dataType:"json",method:"POST",success:function(a){a.error?Botble.showError(a.message):(e.calendar&&e.calendar.refetchEvents(),t.hide(),Botble.showSuccess(a.message)),t.onSubmit=!1,$("#modal-calendar").find(".btn-primary").removeClass("button-loading")},error:function(){t.onSubmit=!1,$("#modal-calendar").find(".btn-primary").removeClass("button-loading")}}))},validateForm:function(){return!!this.form.start_date&&this.form.end_date}},created:function(){var e=this;this.$nextTick((function(){$(e.$el).on("hide.bs.modal",(function(){this.form=Object.assign({},this.formDefault)}))}))},mounted:function(){var e,t=this;e=document.getElementById("dates-calendar"),this.calendar&&this.calendar.destroy(),this.calendar=new FullCalendar.Calendar(e,{headerToolbar:{left:"title"},navLinks:!0,editable:!1,dayMaxEvents:!1,events:{url:$("div[data-get-room-availability-url]").data("get-room-availability-url")},loading:function(t){t?$(e).addClass("loading"):$(e).removeClass("loading")},select:function(e){t.show({start_date:moment(e.start).format("YYYY-MM-DD"),end_date:moment(e.end).format("YYYY-MM-DD")})},eventClick:function(e){var a=Object.assign({},e.event.extendedProps);a.start_date=moment(e.event.start).format("YYYY-MM-DD"),a.end_date=moment(e.event.start).format("YYYY-MM-DD"),t.show(a)},eventRender:function(e){$(e.el).find(".fc-title").html(e.event.title)}}),this.calendar.render()}};const j=(0,a(3744).Z)(M,[["render",function(a,M,$,j,C,k){return(0,e.openBlock)(),(0,e.createElementBlock)("div",null,[t,(0,e.createElementVNode)("div",o,[(0,e.createElementVNode)("div",l,[(0,e.createElementVNode)("div",n,[r,(0,e.createElementVNode)("div",i,[(0,e.createElementVNode)("form",d,[(0,e.createElementVNode)("div",s,[(0,e.createElementVNode)("label",null,(0,e.toDisplayString)(a.__("room_availability.status")),1),m,(0,e.createElementVNode)("label",null,[(0,e.withDirectives)((0,e.createElementVNode)("input",{type:"checkbox","true-value":"1","false-value":"0","onUpdate:modelValue":M[0]||(M[0]=function(e){return C.form.active=e})},null,512),[[e.vModelCheckbox,C.form.active]]),(0,e.createTextVNode)(" "+(0,e.toDisplayString)(a.__("room_availability.is_available")),1)])]),(0,e.createElementVNode)("div",c,[(0,e.withDirectives)((0,e.createElementVNode)("div",u,[(0,e.createElementVNode)("div",v,[(0,e.createElementVNode)("label",f,(0,e.toDisplayString)(a.__("room_availability.value")),1),(0,e.withDirectives)((0,e.createElementVNode)("input",{type:"number",id:"price-input","onUpdate:modelValue":M[1]||(M[1]=function(e){return C.form.value=e}),class:"form-control"},null,512),[[e.vModelText,C.form.value]])])],512),[[e.vShow,C.form.active]]),(0,e.withDirectives)((0,e.createElementVNode)("div",_,[(0,e.createElementVNode)("div",b,[p,(0,e.withDirectives)((0,e.createElementVNode)("select",{"onUpdate:modelValue":M[2]||(M[2]=function(e){return C.form.value_type=e})},[(0,e.createElementVNode)("option",{selected:"fixed"===C.form.value_type,value:"fixed"},(0,e.toDisplayString)(a.__("room_availability.fixed")),9,h),(0,e.createElementVNode)("option",{selected:"amount_adjust"===C.form.value_type,value:"amount_adjust"},(0,e.toDisplayString)(a.__("room_availability.amount_adjust")),9,y),(0,e.createElementVNode)("option",{selected:"percentage_adjust"===C.form.value_type,value:"percentage_adjust"},(0,e.toDisplayString)(a.__("room_availability.percentage_adjust")),9,g)],512),[[e.vModelSelect,C.form.value_type]])])],512),[[e.vShow,C.form.active]])]),"percentage_adjust"===C.form.value_type?((0,e.openBlock)(),(0,e.createElementBlock)("div",V,[(0,e.createElementVNode)("div",E,(0,e.toDisplayString)(a.__("Adjust the value within a range of -100% to unlimited !")),1)])):(0,e.createCommentVNode)("",!0),(0,e.createElementVNode)("div",N,[(0,e.withDirectives)((0,e.createElementVNode)("div",D,[(0,e.createElementVNode)("div",S,[(0,e.createElementVNode)("label",w,(0,e.toDisplayString)(a.__("room_availability.number_of_rooms")),1),(0,e.withDirectives)((0,e.createElementVNode)("input",{type:"number",id:"number-of-rooms","onUpdate:modelValue":M[3]||(M[3]=function(e){return C.form.number_of_rooms=e}),class:"form-control"},null,512),[[e.vModelText,C.form.number_of_rooms]])])],512),[[e.vShow,C.form.active]])])])]),(0,e.createElementVNode)("div",x,[(0,e.createElementVNode)("button",Y,(0,e.toDisplayString)(a.__("room_availability.close")),1),(0,e.createElementVNode)("button",{type:"button",class:"btn btn-primary",onClick:M[4]||(M[4]=function(){return k.saveForm&&k.saveForm.apply(k,arguments)})},(0,e.toDisplayString)(a.__("room_availability.save_changes")),1)])])])])])}]]);"undefined"!=typeof vueApp&&vueApp.booting((function(e){e.component("calendar-modal-component",j)}))})()})();