// Copyright © Neon Abyss Explorer. All rights reserved.

import SwiftUI

fileprivate enum Constants {
    static let radius: CGFloat = 16
    static let indicatorHeight: CGFloat = 6
    static let indicatorWidth: CGFloat = 60
    static let snapRatio: CGFloat = 0.25
    static let minHeightRatio: CGFloat = 0
}

struct BottomSheetView<Content: View>: View {
    @Binding var isOpen: Bool
    
    let maxHeight: CGFloat
    let minHeight: CGFloat
    let content: Content
    let cardPopAnimationResponse: Double = 0.5
    
    @GestureState private var translation: CGFloat = 0
    
    @State var draggedToOpenOffset: CGFloat = 0
    @State var draggedToCloseOffset: CGFloat = 0
    
    private var offset: CGFloat {
        if isOpen {
            return 0 + draggedToCloseOffset
        } else {
            return maxHeight - minHeight + draggedToOpenOffset // draggedToOpenOffset is always negative
        }
    }
    
    private var indicator: some View {
        RoundedRectangle(cornerRadius: Constants.radius)
            .fill(Color.secondary)
            .frame(
                width: Constants.indicatorWidth,
                height: Constants.indicatorHeight
        ).onTapGesture {
            self.draggedToOpenOffset = 0
            self.draggedToCloseOffset = 0
            withAnimation(.interactiveSpring(response: self.cardPopAnimationResponse)) {
                self.isOpen.toggle()
            }
        }
    }
    
    init(isOpen: Binding<Bool>, maxHeight: CGFloat, @ViewBuilder content: () -> Content) {
        self.minHeight = maxHeight * Constants.minHeightRatio
        self.maxHeight = maxHeight
        self.content = content()
        self._isOpen = isOpen
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                self.indicator.padding()
                self.content
            }
            .frame(width: geometry.size.width, height: self.maxHeight, alignment: .top)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(Constants.radius)
            .frame(height: geometry.size.height, alignment: .bottom)
            .offset(y: max(self.offset, 0))
            .gesture(
                DragGesture().updating(self.$translation) { value, state, _ in
                    state = value.translation.height
                }.onEnded { value in
                    let snapDistance = self.maxHeight * Constants.snapRatio
                    // if it's negative, it's dragging up, isOpen = true, open it
                    // if it's positive, it's moving down, isOpen = false, close it
                    let yDraggedValue = value.translation.height
                    let isDraggedUp = yDraggedValue < 0
                    
                    // dragged value isn't more than snapDistance, go back to where it was
                    guard abs(value.translation.height) > snapDistance else {
                        if isDraggedUp {
                            self.draggedToCloseOffset = 0
                            self.draggedToOpenOffset = 0
                            self.draggedToOpenOffset = yDraggedValue
                        } else {
                            self.draggedToOpenOffset = 0
                            self.draggedToCloseOffset = 0
                            self.draggedToCloseOffset = yDraggedValue
                        }
                        
                        withAnimation(.interactiveSpring(response: self.cardPopAnimationResponse)) {
                            self.draggedToOpenOffset = 0
                            self.draggedToCloseOffset = 0
                            self.isOpen = !isDraggedUp
                        }
                        
                        return
                    }
                    
                    if isDraggedUp {
                        self.draggedToCloseOffset = 0
                        self.draggedToOpenOffset = 0
                        self.draggedToOpenOffset = yDraggedValue
                    } else {
                        self.draggedToOpenOffset = 0
                        self.draggedToCloseOffset = 0
                        self.draggedToCloseOffset = yDraggedValue
                    }
                    
                    withAnimation(.interactiveSpring(response: self.cardPopAnimationResponse)) {
                        self.isOpen = isDraggedUp
                    }
                    
                }
            )
        }
    }
}

struct BottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetView(isOpen: .constant(false), maxHeight: 600) {
            Rectangle().fill(Color.red)
        }.edgesIgnoringSafeArea(.all)
    }
}
