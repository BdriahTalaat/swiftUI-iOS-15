//
//  HomeView.swift
//  swiftUI iOS 15
//
//  Created by Bdriah Talaat on 04/02/1446 AH.
//

import SwiftUI

struct HomeView: View {
   
    @State var hasScrolled = false
    @Namespace var namespace
    @State var show = false
    @State var showStateBar = true
    @State var selectedId = UUID()
    @State var showCourse = false
    @State var selectedIndex = 0
    @EnvironmentObject var model : Model
    
    var body: some View {
        // from here make scroll
        
        ZStack {
            
            Color("Background").ignoresSafeArea()
            
            ScrollView {
                            
                scrollDetaction
                
                features
                
                Text("Courses".uppercased())
                    .font(.footnote.weight(.semibold))
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity ,alignment: .leading)
                    .padding(.horizontal,20)
                
                LazyVGrid(columns:[GridItem(.adaptive(minimum: 300),spacing: 20)] ,spacing: 20) {
                    
                    if !show{
                        
                        cards
                        
                    }else{
                        ForEach(courses) { course in
                            Rectangle()
                                .fill()
                                .frame(height: 300)
                                .cornerRadius(30)
                                .shadow(color: Color("Shadow"), radius: 20,x: 0 ,y: 10)
                                .opacity(0.3)
                                .padding(.horizontal,30)
                        }
                    }
                }
                .padding(.horizontal,20)
                
            }
            .coordinateSpace(name: "scroll")
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: hasScrolled ? 44 : 70)
            })
            .overlay {
                NavigationBar(title: "Featured", hasScrolled: $hasScrolled)
                
            }
            
            if show {
                details
            }
            
        }
        // this code to hidden time bar
        .statusBar(hidden: !showStateBar)
        .onChange(of: show, perform: { value in
            
            withAnimation(.closeCard){
                if value{
                    showStateBar = false
                }
                else{
                    showStateBar = true
                }
            }
            
        })
        
        // to here 
    }
    
    var details: some View{
        ForEach(courses) { course in
            
            if course.id == selectedId{
               
                CourseView(course: course,nameSpace: namespace, show: $show)
                    .zIndex(1)
                    .transition(.asymmetric(
                        insertion: .opacity.animation(.easeInOut(duration: 0.1)),
                        removal: .opacity.animation(.easeInOut(duration: 0.3).delay(0.2))
                ))

            }
        }
    }
    
    var cards: some View {
        ForEach(courses) { course in
            CoursItem(course:course, nameSpace: namespace , show: $show)
                .onTapGesture {
                    withAnimation(.openCard) {
                        show.toggle()
                        model.shoeDetail.toggle()
                        showStateBar = false
                        selectedId = course.id
                    }
            }
        }

    }
    var scrollDetaction: some View{
        
        GeometryReader{ proxy in
            Color.clear.preference(key: ScrollPrefranceKey.self, value: proxy.frame(in: .named("scroll")).minY)
        }
        
        .onPreferenceChange(ScrollPrefranceKey.self, perform: { value in
            
            withAnimation(.easeInOut){
                if value < 0 {
                    hasScrolled = true
                }else{
                    hasScrolled = false
                }
            }
        })
    }
    
    var features: some View{
        
        TabView {
            ForEach(Array(featuredCourses.enumerated()),id: \.offset) { index,course in
                GeometryReader { proxy in
                    
                    let minX = proxy.frame(in: .global).minX
                    
                    FeatureItem(course: course)
                        .frame(maxWidth: 600)
                        .frame(maxWidth: .infinity)
                        
                        .padding(.vertical,40)
                        .rotation3DEffect(.degrees(minX / -10),axis: (x: 0, y: 1, z: 0))
                        .shadow(color: Color("Shadow").opacity(0.3), radius: 10,x: 0,y: 10)
                        .blur(radius: abs(minX) / 40)
                        //.blur(radius: minX / 40)
                        .overlay(
                            Image(course.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 230)
                                .offset(x: 32,y: -80)
                                .offset(x: minX / 2)
                        )
                        .onTapGesture {
                            showCourse = true
                            selectedIndex = index
                        }
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 430)
        .background(Image("Blob 1").offset(x:250,y:-100))
        .sheet(isPresented: $showCourse){
            CourseView(course: featuredCourses[selectedIndex],nameSpace: namespace, show: $showCourse)
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(Model())
}
